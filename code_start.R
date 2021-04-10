#' ###########################################
#' Uso do pacote STF para buscar informações do site
#'
#' Primeiro iremos conectar com Github e depois
#' iremos buscar as informações no site do STF
#' ###########################################

# Usar GitHub

library(usethis)

use_git(message ='Initial commit')
#use_github()


#use_github_links()

# Uso da funcão STF

library(stf)

incidentes = 2635061:2635161

stf_download_information(incidentes, dir = "data-raw/informacoes")
stf_download_parties(incidentes,"data-raw/partes")
stf_download_details(incidentes,"data-raw/detalhes")
stf_download_sheet(incidentes, "data-raw/movimentacao")


informacoes <- read_stf_information(path = "data-raw/informacoes")
detalhes <- read_stf_details(path = "data-raw/detalhes")
partes <- read_stf_parties(path = "data-raw/partes")
movimentacao <- read_stf_docket_sheet(path = "data-raw/movimentacao")
download_stf_rtf(movimentacao,path = "data-raw/rtfs")
arquivos <- list.files("data-raw/rtfs", full.names = TRUE)
