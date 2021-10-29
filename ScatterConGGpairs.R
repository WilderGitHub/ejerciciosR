#instalamos las librerias necesarias
pacman::p_load(pacman,party,rio,tidyverse) 
install.packages("GGally")
library(GGally)

#Importamos el excel
BDsectores<-import("CorrelacionesSectores.xlsx")%>% as_tibble
head(BDsectores)
BDtotales<-import("CorrelacionesTotales.xlsx")%>% as_tibble
head(BDtotales)

#Filtramos
BDfiltrado<-BDsectores%>%
  #aqui pones los sectores
  #filter(Sector=="Hidrocarburos")
  ############FILTROS PARA QUE SALGA BONITO
  filter(Fecha !=as.Date("2008-03-01") &Fecha !=as.Date("2008-06-01")&Fecha !=as.Date("2020-06-01"))
  #filter(Sector=="Comercio" & Fecha !=as.Date("2020-06-01"))
  #filter(Sector=="Mineria" & Fecha !=as.Date("2014-12-01")& Fecha !=as.Date("2012-03-01"))
  #filter(Sector=="IndManufac" & Fecha !=as.Date("2012-06-01")& Fecha !=as.Date("2011-03-01"))
  #filter(Sector=="Agricultura" & Fecha !=as.Date("2007-09-01")& Fecha !=as.Date("2007-12-01")& Fecha !=as.Date("2007-03-01")& Fecha !=as.Date("2007-06-01"))
  #filter(Sector=="Construccion" & Fecha !=as.Date("2015-09-01")& Fecha !=as.Date("2015-12-01"))
  #filter(Sector=="TransComunic"& Fecha !=as.Date("2012-09-01"))
#head(BDfiltrado)

#Ponemos en formato para ggpairs
BDfiltradoWide<-BDfiltrado%>%
  pivot_wider(names_from = Variable, values_from = Valor)
BDtotalesWide<-BDtotales%>%
  pivot_wider(names_from = Variable, values_from = Valor)

#unimos los dos tibbles
combenado<- merge(BDfiltradoWide,BDtotalesWide,by=c("Fecha"))

#Ahora dibujamos
ggpairs(combenado,
        columns=c("IED","PIB","IEDTotal","TotalGral","PIBTotal","InvPubTotal","CreditoTotal"),
        aes(color=Sector,
            alpha=.1))


