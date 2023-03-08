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
