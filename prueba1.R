pacman::p_load(pacman,party,rio,tidyverse) 
#Importamos el excel
BDTesis<-import("BDTesis4.xlsx")%>% as_tibble

##  1  ## SCATTERPLOT POR SECTORES
#Filtramos
BDIED<-BDTesis%>%
  filter(Categoria=="OI")
#BDIED
#el PIB lo volvemos tidy
piblong<-PIBs%>%
  pivot_longer(cols = !Periodo, names_to = "SectorINECorto",values_to = "value")

#combinamos los tibbles para cruzar biencito
combenado<- merge(BDIED,piblong,by=c("Periodo","SectorINECorto"))

#sacamos un vector con los sectores
sectores<-combenado%>%
  select(SectorINECorto)%>%
  unique()%>%
  pull(, SectorINECorto)

#hacermos el gráfico
combenado%>%
  #filter(SectorINECorto==sectores[6]|SectorINECorto==sectores[8])%>%
  #filter(SectorINECorto==sectores[7])%>%
  filter(SectorINECorto==sectores)%>%
  ggplot(
    aes(Valor,value,
        color=SectorINECorto))+
  geom_point(size=5,alpha=.5)+
  facet_wrap(~Categoria)

##  2  ## LINEAS POR SECTORES
#Importamos el excel
BDTesis<-import("BDTesis4.xlsx")%>% as_tibble
BDfiltro<-BDTesis%>%
  filter(Categoria!="IC")

BDfiltro
#TotalFinanciamiento <- aggregate(BDTesis$Valor,list(BDTesis$Periodo), FUN=sum)
TotalFinanciamiento <-aggregate(Valor ~ Periodo+Categoria+SectorINECorto, data = BDfiltro, FUN = sum, na.rm = TRUE)
ggplot(TotalFinanciamiento,aes(Periodo,Valor, group=1))+
  geom_line(color = "steelblue",size=1)+
  facet_grid(SectorINECorto~Categoria)
  

