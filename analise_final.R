# Carregar pacotes necessários
library(readr)
library(dplyr)
library(plotly)
library(lubridate)
library(stringr)
library(geobr)
library(ggplot2)

# Importar o dataset
dados <- read_delim("DO24OPEN.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

# Selecionar colunas relevantes
colunas_interesse <- c(
  "IDADE", "DTOBITO", "HORAOBITO", "RACACOR", "CODMUNRES", 
  "ESTCIV", "LOCOCOR", "CODMUNOCOR", "ASSISTMED", "CAUSABAS", "NECROPSIA"
)
dados_filtrados <- dados %>% select(all_of(colunas_interesse))

# Filtrar registros do Espírito Santo (códigos de município iniciados por '32')
dados_es <- dados_filtrados %>% 
  filter(startsWith(as.character(CODMUNRES), "32"))

# Filtrar registros com causas de acidente de trânsito (CID-10: V01 a V89)
dados_acidentes_transito <- dados_es %>%
  filter(grepl("^V(0[1-9]|[1-7][0-9]|8[0-9])", CAUSABAS))

# Criar nova coluna com mês e ano do óbito
dados_acidentes_transito <- dados_acidentes_transito %>%
  mutate(MES_OBITO = format(dmy(DTOBITO), "%Y-%m"))

# Gráfico 1: Óbitos por mês
dados_acidentes_transito %>%
  count(MES_OBITO) %>%
  plot_ly(
    x = ~MES_OBITO,
    y = ~n,
    type = 'scatter',
    mode = 'lines+markers',
    line = list(color = 'royalblue'),
    marker = list(size = 6)
  ) %>%
  layout(
    title = "Óbitos por Acidente de Trânsito por Mês",
    xaxis = list(title = "Mês"),
    yaxis = list(title = "Quantidade de Óbitos")
  )

# Gráfico 2: Óbitos por Estado Civil (Treemap)
dados_acidentes_transito %>%
  mutate(ESTCIV_LABEL = case_when(
    ESTCIV == "1" ~ "Solteiro(a)",
    ESTCIV == "2" ~ "Casado(a)",
    ESTCIV == "3" ~ "Viúvo(a)",
    ESTCIV == "4" ~ "Separado(a)/Divorciado(a)",
    ESTCIV == "5" ~ "União estável",
    ESTCIV == "9" ~ "Ignorado",
    TRUE ~ "Não informado"
  )) %>%
  count(ESTCIV_LABEL) %>%
  plot_ly(
    type = "treemap",
    labels = ~ESTCIV_LABEL,
    values = ~n,
    parents = NA,
    textinfo = "label+value"
  ) %>%
  layout(title = "Óbitos por Estado Civil")

# Gráfico 3: Local de ocorrência (Pizza)
dados_acidentes_transito %>%
  mutate(LOCOCOR_LABEL = case_when(
    LOCOCOR == "1" ~ "Hospital",
    LOCOCOR == "2" ~ "Outros estabelecimentos de saúde",
    LOCOCOR == "3" ~ "Domicílio",
    LOCOCOR == "4" ~ "Via pública",
    LOCOCOR == "5" ~ "Outros",
    LOCOCOR == "9" ~ "Ignorado",
    TRUE ~ "Não informado"
  )) %>%
  count(LOCOCOR_LABEL) %>%
  plot_ly(
    labels = ~LOCOCOR_LABEL,
    values = ~n,
    type = "pie"
  ) %>%
  layout(title = "Distribuição por Local de Ocorrência")

# Gráfico 4: Assistência médica (Pizza)
dados_acidentes_transito %>%
  mutate(ASSISTMED_LABEL = case_when(
    ASSISTMED == "1" ~ "Recebeu assistência médica",
    ASSISTMED == "2" ~ "Não recebeu assistência médica",
    ASSISTMED == "9" ~ "Assistência médica ignorada",
    TRUE ~ "Não informado"
  )) %>%
  count(ASSISTMED_LABEL) %>%
  plot_ly(
    labels = ~ASSISTMED_LABEL,
    values = ~n,
    type = "pie"
  ) %>%
  layout(title = "Situação de Assistência Médica nos Óbitos por Acidente de Trânsito")

# Gráfico 5: Mapa - Óbitos por Município de Ocorrência no ES

# Filtrar registros com CODMUNOCOR iniciando em 32
dados_mapa <- dados_acidentes_transito %>%
  filter(startsWith(as.character(CODMUNOCOR), "32"))

# Contar óbitos por município de ocorrência
dados_obitos_municipio <- dados_mapa %>%
  count(CODMUNOCOR) %>%
  mutate(code_muni = as.numeric(CODMUNOCOR))

# Carregar geometria dos municípios do Espírito Santo
municipios_es <- read_municipality(code_muni = 32, year = 2022)

# Padronizar código do shapefile para os primeiros 6 dígitos
municipios_es <- municipios_es %>%
  mutate(code_muni = as.numeric(substr(as.character(code_muni), 1, 6)))

# Filtrar registros com CODMUNOCOR iniciando em 32
dados_mapa <- dados_acidentes_transito %>%
  filter(startsWith(as.character(CODMUNOCOR), "32"))

# Contar óbitos por município (padronizando também para 6 dígitos)
dados_obitos_municipio <- dados_mapa %>%
  mutate(code_muni = as.numeric(substr(as.character(CODMUNOCOR), 1, 6))) %>%
  count(code_muni)

# Juntar com geometria
mapa_obitos <- municipios_es %>%
  left_join(dados_obitos_municipio, by = "code_muni")

# Plotar o mapa
ggplot(data = mapa_obitos) +
  geom_sf(aes(fill = n), color = "white", size = 0.2) +
  scale_fill_viridis_c(
    option = "magma",
    na.value = "gray90",
    name = "Óbitos",
    direction = -1,
    guide = guide_colorbar(barwidth = 0.5, barheight = 10)
  ) +
  labs(
    title = "Óbitos por Acidentes de Trânsito no Espírito Santo por Município",
    subtitle = "Distribuição espacial dos óbitos registrados em 2024"
  ) +
  theme_void() +
  theme(
    legend.position = c(0.9, 0.3),
    legend.justification = "center",
    plot.title = element_text(face = "bold", size = 14, hjust = 0),
    plot.subtitle = element_text(size = 10, hjust = 0),
    plot.caption = element_text(size = 8, hjust = 1)
  )
