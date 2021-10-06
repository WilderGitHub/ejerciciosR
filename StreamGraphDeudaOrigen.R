#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
library(ggstream)
#importamos los datos oe
df1<-import("DeudaOrigen.xlsx") %>% as_tibble()
#Filtramos el pais y botamos otros que se estaba repitiendo
df1
dfacreedor<-df1%>%
  filter(Acreedor=="China")
dfacreedor
#definimos los colores
cols <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')

#dibujamos el streamgraph
ggplot(dfacreedor, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)+
  labs(title = "Deuda de CAF",
       
       subtitle = "(En millones de $us)",
       caption  = "Fuente: BCB"
  )
# + geom_stream_label(aes(label = Sector))