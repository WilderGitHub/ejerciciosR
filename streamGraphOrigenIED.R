#1. por Sector dado un pais===============================================
#Las librerias de rigor
pacman::p_load(pacman,party,rio,tidyverse) 
library(ggstream)

#1. por pais dados un Sector=====================================
#importamos los datos oe
df<-import("IEDorigen.xlsx") %>% as_tibble()

#Filtramos el sector y botamos otros que se estaba repitiendo
dfpais<-df%>%
  filter(Sector=="Comercio" )
#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")
#dibujamos el streamgraph
ggplot(dfpais, aes(x = Periodo, y = Valor, fill = Pais)) +
  geom_stream() +
  scale_fill_manual(values = cols)#+

#2. por sector dado un Pais====================================  
#importamos los datos oe
df<-import("IEDorigen.xlsx") %>% as_tibble()

#Filtramos el sector y botamos otros que se estaba repitiendo
dfpais<-df%>%
  filter(Pais=="Brasil" )
#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")
#dibujamos el streamgraph
ggplot(dfpais, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)#+

#  3. por sector de todos los paises====================================  
#importamos los datos oe
df<-import("IEDorigen.xlsx") %>% as_tibble()

# Agregamos los sectores
TotalInversores <-aggregate(Valor ~ Periodo+Sector, data = df, FUN = sum, na.rm = TRUE)
#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")
#dibujamos el streamgraph
ggplot(TotalInversores, aes(x = Periodo, y = Valor, fill = Sector)) +
  geom_stream() +
  scale_fill_manual(values = cols)#+

#  4. por pais de todos los sectores====================================  
#importamos los datos oe
df<-import("IEDorigen.xlsx") %>% as_tibble()

# Agregamos los sectores
TotalSectores <-aggregate(Valor ~ Periodo+Pais, data = df, FUN = sum, na.rm = TRUE)
#definimos los colores
cols <- c("#875B52","#E76F51", "#8FA078", "#228176", "#E9C46A", "#59804D", "#F4A261", "#264653", "#BB8865", "#A69B4E", "#65453E", "#E24D28", "#73835D", "#11403B", "#A07918", "#354D2E", "#EF7A1A", "#47829A", "#8E5E3E", "#6F6734", "#902C14", "#3F4833", "#7EDDD3", "#864109", "#274754")
#dibujamos el streamgraph
ggplot(TotalSectores, aes(x = Periodo, y = Valor, fill = Pais)) +
  geom_stream() +
  scale_fill_manual(values = cols)#+

