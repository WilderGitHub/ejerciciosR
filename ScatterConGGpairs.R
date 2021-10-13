#instalamos las librerias necesarias
pacman::p_load(pacman,party,rio,tidyverse) 
install.packages("GGally")
library(GGally)

#Importamos el excel

Dsectores<-import("Tidy05oct.xlsx")%>% as_tibble
head(BDsectores)
##  1  ## SCATTERPLOT POR SECTORES
#Filtramos el sector
BDfiltrado<-BDsectores#%>%
  #filter(SectorTesis=="PetroleoGas")
head(BDfiltrado)

#eLa variable lo volvemos tidy
#pairs(PIBs[,2:4])
BDfiltradoWide<-BDfiltrado%>%
  filter(SectorTesis!="Agricultura"&SectorTesis!="Construccion")%>%
  pivot_wider(names_from = Variable, values_from = Valor)
  #pivot_longer(cols = !Periodo, names_to = "SectorINECorto",values_to = "value")

#del 5 al 9 no considera IC
ggpairs(BDfiltradoWide,
        columns=5:9,
        aes(color=SectorTesis,
            alpha=.1))


