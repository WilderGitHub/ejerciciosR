pacman::p_load(pacman,party,rio,tidyverse) 
#Importamos el excel
BDsectores<-import("Tidy05oct.xlsx")%>% as_tibble
head(BDsectores)
##  1  ## SCATTERPLOT POR SECTORES
#Filtramos el sector
BDfiltrado<-BDsectores#%>%
  #filter(SectorTesis=="PetroleoGas")
head(BDfiltrado)

#eLa variable lo volvemos tidy
#pairs(PIBs[,2:4])
BDfiltradoWide<-BDfiltrado%>%
  pivot_wider(names_from = Variable, values_from = Valor)
  #pivot_longer(cols = !Periodo, names_to = "SectorINECorto",values_to = "value")

#del 5 al 9 no considera IC
pairs(BDfiltradoWide[,5:9],cex=1
      ,col = hcl.colors(8, "Temps")[SectorTesis]
      #,col = BDfiltradoWide$SectorTesis,
      ,main="Titulo"
      ,lower.panel=NULL)


