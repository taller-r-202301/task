#-----------------------------------------#
# Universidad de los Andes
# Taller de R Estadistica y Programación
# 2023-01
# Task Clase 6: Manejo de datos
# Eduard F Martinez


#-------------------------------------#
# 1. Carge la librería tidyverse
if(!require(pacman)){install.packages("pacman") ; require(pacman)}
p_load(tidyverse)

#-------------------------------------#
# 2. Crea una nueva variable llamada am_factor utilizando la función mutate(). 
#    La variable deberá tomar el valor "Automatic" si el valor de am es igual a 0 y "Manual" 
#    si el valor de am es igual a 1.
mtcars_new = mtcars %>% 
               mutate(am_factor = ifelse(am == 0, "Automatic", "Manual"))

#-------------------------------------#
# 3. Crea una nueva variable llamada mpg_factor utilizando la función mutate().
#    La variable deberá tomar el valor "High" si el valor de mpg es mayor a 20, "Medium" si el valor de mpg está entre 15 y 20 (inclusive) y 
#   "Low" si el valor de mpg es menor a 15.

mtcars_new = mtcars_new %>% 
              mutate(mpg_factor = case_when(
                mpg > 20 ~ "High",
                mpg >= 15 & mpg <= 20 ~ "Medium",
                mpg < 15 ~ "Low"
              )) 

#-------------------------------------#
# 4. Selecciona las variables de mtcars que comiencen con mpg y asigne esto a un nuevo objeto
mtcars_mpg = mtcars_new %>% 
              select(starts_with("mpg"))

#-------------------------------------#
# 5. Selecciona la variable que son tipo character y asigne esto a un nuevo objeto
mtcars_numeric = mtcars_new %>% 
                  select_if(is.numeric)

#-------------------------------------#
    # 6. Deseleccione la variable que terminen con la palabra factor o que comiencen con am
mtcars_seselect = mtcars_new %>% 
                    select(-c(ends_with("factor"), starts_with("am")))

