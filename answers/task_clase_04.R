#-----------------------------------------#
# Universidad de los Andes
# Taller de R Estadistica y Programación
# 2023-01
# Task Clase 4: Listas, Directorios de Trabajo
# cargar bases de datos y EDA
# Eduard F Martinez

#--------------------------------------#
# 1. ¿Que es un directorio de trabajo?
cat("El directorio de trabajo, es la dirección en la cual 
    R va a buscar los archivos que tengamos almacenados en nuestro
    computador, si pensamos en el almacenamiento de nuestro PC, 
    como en un armario, el Working Directory, es el cajón donde
    le pedimos a R que busque los archivos.")

#----------------------------------------#
# 2. Imprima en la consola cual es el directorio de trabajo
# actual que está siendo empleado por R
getwd()

#---------------------------------------#
# 3. Reasigne el directorio de trabajo a 
# 2_task-clase-4

setwd("C:/Users/Angel/Documents/tasks/2_task-clase-4/")


#----------------------------------------#
# 4. Cargue un objeto de nombre df el 
# archi gapminder que se encuentra en
# la carpeta input. 
# hint: no olvide cargar la libreria rio

library(pacman)
p_load(rio)

df = import("input/gapminder.csv")

#-----------------------------------------#
#5. Export el objeto df en formato .rds a la 
# carpeta output, llamelo 'gapminder.rds'

export(df,file = "output/gapminder.rds")

#------------------------------------------#
# 6. Cree las siguientes estructuras:
# 1. Vector llamado 'vowels' que contenga las vocales.
# 2. Matriz llamada 'inputs' con dimensiones 2x2 con los numeros del 1 al 4
# 3.  Un dataframe llamado 'db' que contega como variables:
#     - El vector 'vowels'
#     - Un vector llamado 'numbers' que
#       tenga los numeros del 1 al 5

vowels = c("a","e","i","o","u")
inputs = matrix(seq(1:4),nrow = 2,ncol = 2)
db = data.frame(vowels,numbers=c(1:5))

#--------------------------------------------#
# 7. Guarde las estructuras previamente
# creadas en una lista llamada 'collection' 

collection = list(vowels,inputs,db)

#--------------------------------------------#
# 8. Nombre cada elemento dentro de la lista
# 'collection' como el nombre de la estructura en R.

names(collection)=c("vector","matriz","dataframe")

#---------------------------------------------#
# 9. Imprima solo el elemento 2 
# dentro de la lista 'collection

collection[[2]]

#---------------------------------------------#
# 10. Imprima solo la variable vowels del dataframe 
# que se encuentra de la lista 'collection'

collection[[3]][,1]

