#1. por Sector dado un pais===============================================
#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
library(ggstream)
#importamos los datos oe
df<-import("IEDorigen.xlsx") %>% as_tibble()
#Filtramos el pais y botamos otros que se estaba repitiendo
dfpais<-df%>%
  filter(Pais=="Estados Unidos" & Sector!="Otros")

#definimos los colores
#cols <- c("#264653","#A69B4E",'#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd')
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")

#dibujamos el streamgraph
ggplot(dfpais, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)#+
  

