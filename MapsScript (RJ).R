# fonte dos dados:
# http://www.data.rio/datasets/limite-bairro
# http://www.data.rio/search?groupIds=0f4009068ec74e17b25eb3e70891b95f&sort=-modified

setwd("E:/00 - CPDOC/03 - Introdução ao R")

#instalando e habilitando pacotes
install.packages("spdep", dependencies = TRUE)
install.packages("stringr", dependencies = TRUE)
install.packages("maptools", dependencies = TRUE)
install.packages("rgdal", dependencies = TRUE)

library(spdep)
library(stringr)
library(maptools)
library(rgdal)

# Função "readOGR" para criar um objeto com o mapa (o shp) a ser utilizado
# nome do objeto <- funcao("nome da pasta", "nome do arquivo shp")

BairrosRIO <- readOGR("Limite_Bairro", "Limite_Bairro")

plot(BairrosRIO)      # plota o mapa do Brasil

dadosbairroRIO <- read.csv(file.choose(),sep=";",dec=",")


## Relaciona os estados do "banco" com as informa??es dos "dados"

dadosMapaRio <- merge(BairrosRIO, dadosbairroRIO, by.x = c("CODBAIRRO"), by.y = c("CODBAIRRO"), all.x = T)

dim(dadosMapaRio)

#gerando o mapa 

spplot(dadosMapaRio, "Branca")

# escala de cor cinza com 100 tonalidades

spplot(dadosMapaRio, "Branca", col.regions=grey.colors(100))

Votos_zona <- read.csv2(file.choose(),sep=";",dec=",")
Votos_zona_clean <- Votos_zona[,-c(1:14,17, 19:20, 22, 23:24, 26:29, 31:37)]
Votos_zona_ver <- data.frame(subset(Votos_zona_clean, DS_CARGO == "Vereador"))
Votos_zona_rj <- data.frame(subset(Votos_zona_ver, NM_MUNICIPIO == "RIO DE JANEIRO"))
Votos_zona_fin <- data.frame(subset(Votos_zona_rj, DS_SITUACAO_CANDIDATURA == "APTO"))

write.csv2(Votos_zona_fin, "C:/Users/b35489/Documents/GitHub/-Race-and-municipal-elections-of-Rio-in-2016/votos_zona.csv")
