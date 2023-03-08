#-----------------------------------------#
# Universidad de los Andes
# Taller de R Estadistica y Programación
# 2023-01
# Task Clase 3: Vectores,Matrices y Dataframes
# Eduard F Martinez

#------------------------------------------#
# En el siguiente script se le solicitará 
# realizar ciertas tareas con la finalidad 
# de afianzar su conocimento en el 
# manejo de estructuras en R.

#-------------------------------------------#
# 1. Genere un vector llamado 'my_space',
# el cual tendrá 4 elementos en su interior:
# "marte","jupiter","tierra","luna", asegurese 
# de seguir ese orden. 

my_space = c("marte","jupiter","tierra","luna")

#---------------------------------------------#
# 2. Utilice al menos 3 formas de diferentes 
# para quedarse solo con el elemento "luna".

my_space[[4]]

my_space[[c(4)]]

my_space[-c(1,2,3)]

my_space[c(F,F,F,T)]

#-------------------------------------------------#
# 3. Reorganice la posición de los elementos
# dentro del vector, asignando el verdadero orden 
# de los cuerpos celestes en el sistema solar como 
# las nuevas posiciones, asegurese de guardar los 
# cambios nuevamente en el objeto 'my_space'.

my_space = my_space[c(3,4,1,2)]

#--------------------------------------#
#4. Cree un vector llamado 'odds',
# con los numeros impares del 1 al 8
# y otro llamado 'evens' con los
# numeros pares del 1 al 4
# hint: Puede hacerlo de manera manual
# o puede usar la funcion seq().

odds = seq(1,8,2)
odds = c(1,3,5,7)

evens =seq(2,8,2)
evens = c(2,4,6,8)

#-------------------------------------#
# 5. Combine los dos vectores que 
# se pueden unir en uno solo,
# llamelo 'final_vector'.

final_vector = c(evens,odds)

#----------------------------------------#
# 5. Cree una matriz usando solo
# los dos vectores que se pueden combinar 
# dentro de esta y llamaela 'the_matrix'.

the_matrix = matrix(final_vector,ncol = 2,byrow = 2)

#-----------------------------------------#
# 6. Imprima en la consola el elemento 
# que está en la fila 3 y en la columna 2 
# de la matriz. 

the_matrix[3,2]

#---------------------------------------#
# 7. Convierta en NA, todos los elementos
# impares de la matriz

the_matrix[the_matrix %in% odds]=NA

#--------------------------------------#
# 8. Cree un data frame con todos los 
# vectores que tengan la misma longitud,
# llamelo 'my_data'.

my_data = data.frame(evens,odds,my_space)

#------------------------------------------#
# 9. Calcule la suma de cada uno de las 
# observaciones de las variables numericas,

sum(my_data$evens)
sum(my_data$odds)

#------------------------------------#
# 10. Elimine la variable cuyos
# elementos sumen la menor cantidad.

my_data= my_data[,-2]


