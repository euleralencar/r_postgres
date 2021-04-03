# https://github.com/euleralencar/r_postgres.git

setwd("~/Documents/projetos/projetos_r/r_postgres")

install.packages(c("tidyverse","remotes","RPostgres","dbx"))
remotes::install_github("jjesusfilho/stf")
install.packages("usethis")

# Usando fatores

names <- c('a','b','c')
names <- as.factor(names)


# não converta numero em fatores direto
# primeir converta para carater 3 depois aplique fatores

numer <- c(20, 23, 3)
numer <- as.factor(numer)
numer

# usar a melhor prática acima

numer <- as.character(numer)
numer <- as.factor(numer)
numer

# Data-frame

df <- data.frame(nome = c("nome1","nome2","nome3"),
                 idade = c(42,65,12),
                 religiao = c("cristao","matriz-afro","budista"),
                 sexo = c("masculino","masculino","feminino"))

df$sexo <- as.factor(df$sexo)
df$religiao <- as.factor(df$religiao)

# Matriz

m <- matrix(1:10, nrow= 5, byrow=T) #Preenche os elementos da MAT pela linha
m

m <- matrix(1:10, nrow= 5, byrow=F) #Preenche os elementos da MAT pela coluna
m

# Listas

lista <- list(df, m, names, numer)
lista

# para acessar os elementos

lista[[1]]$nome #acessando a lista 1 e coluna nome
lista[[3]][2] # acessando lista 3 e selecionando segundo termo

# posso criar listas nomeadas
lista <- list(meudf = df, matriz = m, nomes = names, numero = numer)
lista

# para apagar valores (neste caso matriz)
l2 <- lista[-2]
l2

# soma dos 100 primeiros numeros
x <- 1:100
sum(x)

#soma dos 100 primeiros numeros pares - sol1
y <- x %% 2

df <- data.frame(x,y)
df

# soma dos pares
p <- sum(subset(df, y == 0)$x)
# soma dos impares
i <- sum(subset(df, y == 1)$x)
p+i

#soma dos 100 primeiros numeros pares - sol2
a=0
for (i in x){
  if (i %% 2 ==0) {
    a = a+i
  }
}
print(a)

num = as.integer(readline(prompt="Enter a number: "))
  if((num %% 2) == 0) {
    print(paste(num,"is Even"))
    } 
  else {
    print(paste(num,"is Odd"))
  }
