

library(dplyr)
  relator <- 
    detalhes %>%
      count(relator_atual) %>%
        View()

  
relator_classe <- 
   detalhes %>%
    count(relator_atual, classe, sort=TRUE) %>%
     View()

View(detalhes)

# Filter

ai <- 
  detalhes %>%
    filter(classe=="AI") %>%
      View()


ai_hc <- 
  detalhes %>%
  filter(classe=="AI" | classe == "HC") %>%
    View()

ai_presidente <- 
  detalhes %>%
    filter(classe=="AI", relator_atual=="MINISTRO PRESIDENTE") %>%
      View()


na <- detalhes %>%
        filter(numero_unico=="0004757-27.2008.0.01.0000" | is.na(numero_unico)) %>%
          View()

na <- detalhes %>%
  filter(numero_unico=="0004757-27.2008.0.01.0000") %>%
  View()


# Select

info <- informacoes %>%
          select(1,2,4) %>%
            View()


info <- 
  informacoes %>%
  select(starts_with("assunto")) %>%
  View()

info <- 
  informacoes %>%
  select(starts_with("origem")) %>%
  View()


info <- 
  informacoes %>%
  select(contens("origem")) %>%
  View()

# Estudar sobre expressões regulares


assuntos <- 
  informacoes %>%
  select(matches("\\d")) %>%
  View()


assuntos <- 
  informacoes %>%
  select(assunto = assunto1) %>%
  View()

#????? - Não entendi bem

# Arrange

det <- 
  detalhes %>%
  arrange(relator_atual) %>%
  View()

det <- 
  detalhes %>%
  arrange(desc(relator_atual)) %>%
  View()

## Mutate

info <- 
  informacoes %>%
  mutate(ano_protocolo = lubridate::year(data_protocolo)) %>%
  relocate(ano_protocolo,  .after = data_protocolo) %>%
  View()

info <- 
  informacoes %>%
  mutate(ano_protocolo = lubridate::year(data_protocolo), .after=data_protocolo) %>%
  View()

# Criar uma coluna somente NULL
      
info <- 
  informacoes %>%
  mutate(ano_protocolo = NULL) %>%
  View()


info <- 
  informacoes %>%
  mutate(
    ano_protocolo = lubridate::year(data_protocolo),
    mes_protocolo = lubridate::month(data_protocolo),
    dia_semana = lubridate::wday(data_protocolo, label = TRUE, abbr=FALSE), .after=data_protocolo
    ) %>%
  View()


movimentacao %>% 
select(!starts_with("doc")) %>% 
  mutate(ano = lubridate::year(data_andamento),
         mes = lubridate::month(data_andamento, label = T)) %>% 
  group_by(ano, mes) %>% 
  summarise(qt.mes = n()) %>% 
  ungroup() %>% 
  group_by(ano) %>% 
  mutate(media.ano = mean(qt, na.rm=T)) %>% 
  ungroup() %>% 
  arrange(desc(media.ano))
