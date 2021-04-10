# Para quem está acessando Postgre local
conn <- DBI::dbConnect(RPostgres::Postgres(), 
                       host = "localhost", 
                       user = 'postgres', 
                       dbname = 'postgres',
                       password = 'senha')

#usethis::edit_r_environ("project") -> o que faz?

setwd("~/Documents/projetos/projetos_r/r_postgres")
#base_stf <- load(file = "data-raw/base_stf.rda")

save(detalhes,informacoes,movimentacao, file = "data-raw/base_stf.rda")

DBI::dbExecute(conn,"create database stf")


lista <- DBI::dbGetQuery(conn, "select datname name, 
                                       datcollate collate, 
                                       datctype ctype, 
                                       pg_encoding_to_char(encoding) encoding ,
                                       datacl access_privileges 
                                from pg_database")

pg_l <- function(conex){
  DBI::dbGetQuery(conex,"SELECT d.datname as Name,
       pg_catalog.pg_get_userbyid(d.datdba) as Owner,
       pg_catalog.pg_encoding_to_char(d.encoding) as Encoding,
       d.datcollate as Collate,
       d.datctype as Ctype,
       pg_catalog.array_to_string(d.datacl, E'\n') AS Access FROM pg_catalog.pg_database d ORDER BY 1")
}
## ? Como professor gerou essa query no banco?

#Chamando a função
pg_l(conn)

# Como enviar informação pro dw

informacoes <- as.data.frame(informacoes)
DBI::dbWriteTable(conn,"informacoes", informacoes, overwrite=T)

movimentacao <- as.data.frame(movimentacao)
DBI::dbWriteTable(conn,"movimentacao",movimentacao)

detalhes <- as.data.frame(detalhes)
DBI::dbWriteTable(conn,"detalhes", detalhes)

tabelas <- DBI::dbListTables(conn)

tabelas
class(informacoes)


