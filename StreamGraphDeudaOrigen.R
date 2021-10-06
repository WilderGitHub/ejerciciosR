#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
library(ggstream)
#importamos los datos oe
df<-import("DeudaOrigen.xlsx") %>% as_tibble()
#Filtramos el pais y botamos otros que se estaba repitiendo
dfacreedor<-df%>%
  filter(Acreedor=="CAF")

#definimos los colores
cols <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')

#dibujamos el streamgraph
#OJO ESTE PERIODO DEBE SER CONTINUO OE, ESO ESTABA ARRUINANDO
ggplot(dfacreedor, aes(x = Pperiodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  labs(title = "IED de España",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
# + geom_stream_label(aes(label = Sector))