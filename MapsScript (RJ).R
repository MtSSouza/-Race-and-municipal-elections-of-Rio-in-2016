Votos_zona <- read.csv2("C:/Users/b35489/Downloads/votacao_candidato_munzona_2016_RJ.csv")
Votos_zona_ver <- data.frame(subset(Votos_zona, DS_CARGO == "Vereador"))
