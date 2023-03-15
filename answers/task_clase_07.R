#==============================================================================#
# Autor: Eduard-Martinez
# Update: 
# R version 4.1.1 (2021-08-10)
#==============================================================================#

# clean environment and load packages
rm(list=ls())
require(pacman)
p_load(tidyverse,rio,janitor)

# Para este task debe:

## 1. Población:
### 1.1. Vaya al siguiente link:
browseURL(url="https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/proyecciones-de-poblacion")
### 1.2. Importe la "Serie municipal de población por área, para el periodo 2018 -2035.xlsx"

## 2. Valor Agregado:
### 2.1. Vaya al siguiente link:
browseURL(url="https://www.dane.gov.co/index.php/estadisticas-por-tema/cuentas-nacionales/cuentas-nacionales-departamentales")
### 2.2. Importe la "Valor agregado por municipio - serie (2011-2020 provisional)"

## 3. Limpie y una las bases de datos del punto 1 y 2 y cree una nueva variable que sea el valor agregado por habitante en pesos


#=================================#
# Indice de Importancia Economica #
#=================================#

## importar base de datos
va = import("https://www.dane.gov.co/files/investigaciones/pib/departamentales/B_2015/anexo-2020-provisional-valor-agregado-municipio-2011-2020.xlsx",
            sheet="Cuadro 11" , skip=8)
  
## clean names
va = va %>% clean_names()

## subset  data
va = va %>% subset(is.na(municipio)==F)

## gen var
va = va %>% 
     mutate(va_pesos = valor_agregado*1e+9)
va = va %>% select(codigo_municipio,valor_agregado,va_pesos)    

## rename var
va = va %>% rename(cod_mpio=codigo_municipio)

#===========#
# Poblacion #
#===========#

# load data
pop = import(file="https://www.dane.gov.co/files/censo2018/proyecciones-de-poblacion/Municipal/anexo-proyecciones-poblacion-Municipal_Area_2018-2035.xlsx",
             skip=10 , encoding="UTF-8")

## clean names
colnames(pop)
pop = pop %>% clean_names()
colnames(pop)

## pivotear data
pop = pop %>%
      mutate(area=ifelse(area_geografica=="Total","total",
                         ifelse(area_geografica=="Cabecera Municipal","urbana","rural")))
pop = pop %>% select(-area_geografica)
pop = pop %>% 
      pivot_wider(names_from="area",values_from="total")

## selct var
pop = pop %>%
      rename(cod_mpio=dpmp,
             pop_urbana=urbana,
             pop_rural=rural,
             pop_total=total) %>%
      select(cod_mpio,ano,starts_with("pop_"))

## subset data
pop = pop %>%
      subset(ano==2020) %>%
      select(-ano)

#=====================#
# Unir bases de datos #
#=====================#

## join
va_pop = left_join(x=va , y=pop , by="cod_mpio")

## gen vars
va_pop = va_pop %>% mutate(va_pesos_pop = va_pesos/pop_urbana)

## export data
export(va_pop , "output/datos_procesados.xlsx")




