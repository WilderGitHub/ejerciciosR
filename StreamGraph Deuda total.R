#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
#install("ggstream")
install.packages("ggstream")
library(ggstream)
#1. por sector dado un Acreedor===============================================
#importamos los datos oe
df<-import("DeudaOrigen.xlsx") %>% as_tibble()
#Filtramos el pais y botamos otros que se estaba repitiendo
dfacreedor<-df%>%
  filter(Acreedor=="IDA")

#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")
#cols <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')

#dibujamos el streamgraph
#OJO ESTE PERIODO DEBE SER CONTINUO OE, ESO ESTABA ARRUINANDO
ggplot(dfacreedor, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  labs(title = "Desembolsos de España",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
# + geom_stream_label(aes(label = Sector))

#2. agregado por acreedor  ======================
#importamos los datos oe
df1<-import("DeudaOrigen.xlsx") %>% as_tibble()

df11 = subset(df1, select = -c(Pperiodo,Trimestre) )
head(df11)
df2<-import("DeudaPrivadaOrigen.xlsx") %>% as_tibble()
#Filtramos el pais y botamos otros que se estaba repitiendo
df <- rbind(df11, df2)
dfacreedor<-df#%>%
#  filter(Acreedor=="CAF"|Acreedor=="BID"|Acreedor=="PRIV"|Acreedor=="China"|Acreedor=="IDA"|Acreedor=="PDVSA"|
#Acreedor=="FONPLATA"|Acreedor=="AFD"|Acreedor=="BIRF"|Acreedor=="OPEP"|Acreedor=="PROEX BRASIL"|Acreedor=="FIDA")
TotalAcreedores <-aggregate(Valor ~ Periodo+Acreedor, data = dfacreedor, FUN = sum, na.rm = TRUE)
#definimos los colores
#cols <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')
cols <- c("#adadad","#969696", "#7a7a7a", "#b5de2b", "#7a7a7a", "#4d4949", "#757575", "#26828e", "#4d4c4c", "#482878", "#858282", "#9e9e9e", "#fde725", "#707070", "#878787", "#424242", "#8a8a8a", "#696969", "#4d4d4d", "#a8a8a8", "#5e5e5e", "#4d4d4d", "#828282", "#919191", "#6b6b6b", "#a3a3a3", "#787878", "black", "#919191", "#6b6a6a", "#35b779", "#878787", "#575757", "#8a8a8a")

#dibujamos el streamgraph
#OJO ESTE PERIODO DEBE SER CONTINUO OE, ESO ESTABA ARRUINANDO
ggplot(TotalAcreedores, aes(x = Periodo, y = Valor, fill = Acreedor)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  #scale_colour_brewer(palette = "Set2")+
  labs(title = "Flujos de deuda por Acreedor",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
 #+ geom_stream_label(aes(label = Acreedor))

