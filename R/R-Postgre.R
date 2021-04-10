
# Para quem está acessando Postgre local
conn <- DBI::dbConnect(RPostgres::Postgres(), 
                       host = "localhost", 
                       user = 'postgres', 
                       dbname = 'postgres',
                       password = 'senha')

# Para conexão dos dados na nuvem
conn <- DBI::dbConnect(RPostgres::Postgres(), 
                  host = "direito.consudata.com.br", 
                  user = 'euler', 
                  dbname = 'edicao3',
                  password = 'rcdpost!gres')


# Para desconectar o banco de dados
DBI::dbDisconnect(conn)
