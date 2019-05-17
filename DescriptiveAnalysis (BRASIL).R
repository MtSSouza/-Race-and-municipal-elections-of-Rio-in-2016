install.packages("gmodels")
install.packages("descr")

library(gmodels)
library(descr)  

Bd2018csv <- read.csv2("C:/Users/b35489/Downloads/consulta_cand_2018_BRASIL.csv")
Bd2018clear <- data.frame(subset(Bd2018csv, DS_SITUACAO_CANDIDATURA == "APTO"))
Bd2018final <- data.frame(subset(Bd2018clear, DS_CARGO == "DEPUTADO FEDERAL"))

freq(Bd2018final$DS_COR_RACA)
freq(Bd2018final$DS_SIT_TOT_TURNO)

install.packages("memisc")
library(memisc)

Bd2018final$EleitoNEleito <- recode(Bd2018final$DS_SIT_TOT_TURNO, 
                                    "ELEITO" <- c("ELEITO", "ELEITO POR MÉDIA", "ELEITO POR QP"),
                                    "Ñ_ELEITO" <- c("NÃO ELEITO", "SUPLENTE", "2º TURNO", "#NULO#"))

freq(Bd2018final$EleitoNEleito)

Bd2018final$RaçaCateg <- recode(Bd2018final$DS_COR_RACA,
                                "BRANCOS" <- c("BRANCA"),
                                "NÃO_BRANCOS" <- c("AMARELA", "INDÍGENA", "PARDA", "PRETA"))
freq(Bd2018final$RaçaCateg)

Bd2018eleitosraça <- data.frame(subset(Bd2018final, EleitoNEleito == "ELEITO"))
freq(Bd2018eleitosraça$RaçaCateg)

Bd2014csv <- read.csv2("C:/Users/b35489/Downloads/consulta_cand_2014_BRASIL.csv")
Bd2014clear <- data.frame(subset(Bd2014csv, DS_SITUACAO_CANDIDATURA == "APTO"))
Bd2014final <- data.frame(subset(Bd2014clear, DS_CARGO == "DEPUTADO FEDERAL"))

freq(Bd2014final$DS_COR_RACA)
freq(Bd2014final$DS_SIT_TOT_TURNO)

Bd2014final$EleitoNEleito <- recode(Bd2014final$DS_SIT_TOT_TURNO, 
                                    "ELEITO" <- c("ELEITO", "ELEITO POR MÉDIA", "ELEITO POR QP"),
                                    "Ñ_ELEITO" <- c("NÃO ELEITO", "SUPLENTE", "2º TURNO", "#NULO#"))

freq(Bd2014final$EleitoNEleito)

Bd2014final$RaçaCateg <- recode(Bd2014final$DS_COR_RACA,
                                "BRANCOS" <- c("BRANCA"),
                                "NÃO_BRANCOS" <- c("AMARELA", "INDÍGENA", "PARDA", "PRETA"))
freq(Bd2014final$RaçaCateg)

Bd2014eleitosraça <- data.frame(subset(Bd2014final, EleitoNEleito == "ELEITO"))
freq(Bd2014eleitosraça$RaçaCateg)

install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

Bd2018eleitosraça %>% 
  count(RaçaCateg) %>% 
  mutate(Percentual = n / nrow(Bd2018eleitosraça)*100) -> bdplot

ggplot(bdplot, aes(x = RaçaCateg, y = Percentual)) + geom_bar(stat = "identity", fill = "cyan4")

Bd2018final %>% 
  count(RaçaCateg) %>% 
  mutate(Percentual = n / nrow(Bd2018final)*100) -> bdplot2

ggplot(bdplot2, aes(x = RaçaCateg, y = Percentual)) + geom_bar(stat = "identity", fill="chartreuse4")

Bd2014eleitosraça %>% 
  count(RaçaCateg) %>% 
  mutate(Percentual = n / nrow(Bd2014eleitosraça)*100) -> bdplot3

ggplot(bdplot3, aes(x = RaçaCateg, y = Percentual)) + geom_bar(stat = "identity", fill = "cyan3")

Bd2014final %>% 
  count(RaçaCateg) %>% 
  mutate(Percentual = n / nrow(Bd2014final)*100) -> bdplot4

ggplot(bdplot4, aes(x = RaçaCateg, y = Percentual)) + geom_bar(stat = "identity", fill="chartreuse3")
