#instalamos las librerias necesarias
pacman::p_load(pacman,party,rio,tidyverse) 
install.packages("GGally")
library(GGally)

#   1    Importamos el excel
BDsectores<-import("CorrelacionesSectores.xlsx")%>% as_tibble
head(BDsectores)
BDtotales<-import("CorrelacionesTotales.xlsx")%>% as_tibble
head(BDtotales)

#Filtramos
BDfiltrado<-BDsectores%>%
  #aqui pones los sectores
  #filter(Sector=="Hidrocarburos")
  #FEchas para Deuda
  filter(Fecha !=as.Date("2020-06-01"))
   ############FILTROS PARA QUE SALGA BONITO
   #filter(Sector=="Comercio" & Fecha !=as.Date("2020-06-01"))
  #filter(Sector=="Mineria" & Fecha !=as.Date("2014-12-01")& Fecha !=as.Date("2012-03-01"))
  #filter(Sector=="IndManufac" & Fecha !=as.Date("2012-06-01")& Fecha !=as.Date("2011-03-01"))
  #filter(Sector=="Agricultura" & Fecha !=as.Date("2007-09-01")& Fecha !=as.Date("2007-12-01")& Fecha !=as.Date("2007-03-01")& Fecha !=as.Date("2007-06-01"))
  #filter(Sector=="Construccion" & Fecha !=as.Date("2015-09-01")& Fecha !=as.Date("2015-12-01"))
  #filter(Sector=="TransComunic"& Fecha !=as.Date("2012-09-01"))
#head(BDfiltrado)

# #Ponemos en formato para ggpairs
BDfiltradoWide <- BDfiltrado %>%
  pivot_wider(names_from = Variable, values_from = Valor)
BDtotalesWide <- BDtotales %>%
  pivot_wider(names_from = Variable, values_from = Valor)

#unimos los dos tibbles
combenado<- merge(BDfiltradoWide,BDtotalesWide,by=c("Fecha"))

#Ahora dibujamos
# ggpairs(combenado,
#         columns=c("IEDTotal","PIBTotal","InvPubTotal"),
#         aes(color=Sector,
#             alpha=.1))

#plot(combenado$IEDTotal,combenado$PIBTotal, main = "IED total  y Crecimiento PIB",xlab = "IED Total",   ylab = "Crecimiento")

# Periodos de TOTALES
primer <- as.Date("31-12-12",format="%d-%m-%y")
segundo <- as.Date("31-12-17",format="%d-%m-%y")



periodos<-combenado %>% mutate(Periodo =
                     case_when(Fecha <= primer ~ "2005-2012", 
                               Fecha <= segundo ~ "2009-2017",
                               Fecha >segundo ~ "2016-2020"))
                     
#conDeuda<-periodos %>% mutate(Deuda = OI+IC)

ggplot(periodos, aes(x=OITotal, y=PIBTotal, color=Periodo)) +
  geom_point(size=7,alpha=.05) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

# Periodos de sectores (Tienes que hacer correr desde el principio oe , del 1)

periodosSectores<-periodos%>%
  #aqui pones los sectores
  
  ############FILTROS PARA QUE SALGA BONITO
  #filter(Sector=="Hidrocarburos")
  #filter(Sector=="Hidrocarburos"&Fecha !=as.Date("2008-03-01") &Fecha !=as.Date("2008-06-01")&Fecha !=as.Date("2020-06-01"))
  #filter(Sector=="Comercio" & Fecha !=as.Date("2020-06-01"))
  #filter(Sector=="Mineria" & Fecha !=as.Date("2014-12-01")& Fecha !=as.Date("2012-03-01"))
  #filter(Sector=="Mineria")
  #filter(Sector=="Construccion")
  #filter(Sector=="Otros")
  #filter(Sector=="Comercio")
  filter(Sector=="IndManufac")
  #filter(Sector=="IndManufac" & Fecha !=as.Date("2012-06-01")& Fecha !=as.Date("2011-03-01"))
  #filter(Sector=="Agricultura" & Fecha !=as.Date("2007-09-01")& Fecha !=as.Date("2007-12-01")& Fecha !=as.Date("2007-03-01")& Fecha !=as.Date("2007-06-01"))
  #filter(Sector=="Construccion" & Fecha !=as.Date("2015-09-01")& Fecha !=as.Date("2015-12-01"))
  #filter(Sector=="TransComunic"& Fecha !=as.Date("2012-09-01"))
  #head(BDfiltrado)

primer <- as.Date("31-12-12",format="%d-%m-%y")
segundo <- as.Date("31-12-17",format="%d-%m-%y")



periodos<-combenado %>% mutate(Periodo =
                                 case_when(Fecha <= primer ~ "2005-2012", 
                                           Fecha <= segundo ~ "2009-2017",
                                           Fecha >segundo ~ "2016-2020"))

ggplot(periodosSectores, aes(x=OI, y=PIBTotal, color=Periodo)) +
  geom_point(size=7,alpha=.3) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)#+ylim(0,0.2)#+xlim(-250,800)

