#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
install.packages("ggstream")
library(ggstream)

#1. por sector dado un Acreedor===============================================
#importamos los datos oe
df<-import("DeudaPrivadaOrigen.xlsx") %>% as_tibble()
#Filtramos el acreedor y botamos otros que se estaba repitiendo
dfacreedor<-df%>%
  filter(Acreedor=="Suiza")

#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")

#dibujamos el streamgraph
#OJO ESTE PERIODO DEBE SER CONTINUO OE, ESO ESTABA ARRUINANDO
ggplot(dfacreedor, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  labs(title = "Desembolsos de Chile",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
# + geom_stream_label(aes(label = Sector))

#2. agregado por acreedor  ======================
#importamos los datos oe
df<-import("DeudaPrivadaOrigen.xlsx") %>% as_tibble()

#Filtramos el pais y botamos otros que se estaba repitiendo
dfacreedor<-df#%>%
#  filter(Acreedor=="CAF"|Acreedor=="BID"|Acreedor=="PRIV"|Acreedor=="China"|Acreedor=="IDA"|Acreedor=="PDVSA"|
#Acreedor=="FONPLATA"|Acreedor=="AFD"|Acreedor=="BIRF"|Acreedor=="OPEP"|Acreedor=="PROEX BRASIL"|Acreedor=="FIDA")
TotalAcreedores <-aggregate(Valor ~ Periodo+Acreedor, data = dfacreedor, FUN = sum, na.rm = TRUE)
#definimos los colores
#cols <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")

#dibujamos el streamgraph
#OJO ESTE PERIODO DEBE SER CONTINUO OE, ESO ESTABA ARRUINANDO
ggplot(TotalAcreedores, aes(x = Periodo, y = Valor, fill = Acreedor)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  labs(title = "Flujos de deuda por pais",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
 #+ geom_stream_label(aes(label = Acreedor))

