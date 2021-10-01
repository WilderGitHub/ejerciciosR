pacman::p_load(pacman,party,rio,tidyverse) 
BDTesis<-import("BDTesis4.xlsx")%>% as_tibble

#### scatterplot por sectores
BDIED<-BDTesis%>%
  filter(Categoria=="IED")

BDIED
piblong<-PIBs%>%
  pivot_longer(cols = !Periodo, names_to = "SectorINECorto",values_to = "value")
piblong
combenado<- merge(BDIED,piblong,by=c("Periodo","SectorINECorto"))
sectores<-combenado%>%
  select(SectorINECorto)%>%
  unique()%>%
  pull(, SectorINECorto)
combenado%>%
  #filter(SectorINECorto==sectores[6]|SectorINECorto==sectores[8])%>%
  #filter(SectorINECorto==sectores[6])%>%
  filter(SectorINECorto==sectores)%>%
  ggplot(
    aes(Valor,value,
        color=SectorINECorto))+
  geom_point(size=5,alpha=.5)

##Crecimiento por categoria funcional
