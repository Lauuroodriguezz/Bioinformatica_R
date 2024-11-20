# Pregunta 1: Carga los datos y examínelos en R. Emplea las funciones head(), summary(), dim() y str(). ¿Cuántas variables hay? ¿Cuántos tratamientos? 

# Para cargar los datos desde el archivo:  
datos = read.table("/Users/laurar.m./Desktop/Bioinformatica/R/trabajo final/datos-trabajoR.txt",  header = TRUE,  sep = "\t")  

# Para examinar las primeras filas de los datos y obtener una vista rápida:
head(datos) 

# Para obtener un resumen estadístico de cada variable en el conjunto de datos: 
summary(datos) 

# Para ver las dimensiones del conjunto de datos (número de filas y columnas):
dim(datos)

# Para examinar la estructura del conjunto de datos, incluyendo tipos de variables y ejemplos de valores: 
str(datos)

# Para responder a la primera pregunta: 
# Hay que obtener el número de variables (columnas) en el conjunto de datos 
num_variables <- ncol(datos)  # Cuenta el número de columnas 
cat("Número de variables:", num_variables, "\n") 
# Hay 4 columnas
 
# Para responder a la segunda pregunta: 
# Hay que obtener el número de tratamientos únicos, asumiendo que hay una columna llamada "Tratamiento" que contiene los tratamientos
num_tratamientos <- length(unique(datos$Tratamiento)) # Cuenta los tratamientos únicos en la columna "Tratamiento" 
cat("Número de tratamientos:", num_tratamientos, "\n")
# Hay 6 tratamientos 
 
 
# Pregunta 2: Haz un Boxplot para nuestros datos. Uno para cada condición. Elige un color para condición y guárdalo para los siguientes gráficos. 

# Para definir los colores de cada condición: 
colores = c("Wildtype" = "skyblue", "Sequia" = "salmon", "ExcesoRiego" = "lightgreen") 

# Para crear un gráfico conjunto que compare las tres condiciones (Wildtype, Sequia, ExcesoRiego), sin incluir el tratamiento:
boxplot(datos$Wildtype, datos$Sequia, datos$ExcesoRiego, names = c("Wildtype", "Sequia", "ExcesoRiego"), col = colores, main = "Boxplot para cada condición", xlab = "Condiciones", ylab = "Valores")  

# Para crear la leyenda para identificar los colores de cada condición que se representa en cada Boxplot 
legend("topright", legend = names(colores), fill = colores, title = "Condiciones") 

# Para definir los colores de cada condición incluyendo el tratamiento: 
colores = c("Tratamiento" = "lightpink", "Wildtype" = "skyblue", "Sequia" = "salmon", "ExcesoRiego" = "lightgreen") 
 
# Para crear el boxplot: 
boxplot(datos$Tratamiento, datos$Wildtype, datos$Sequia, datos$ExcesoRiego, names = c("Tratamiento", "Wildtype", "Sequia", "ExcesoRiego"), col = colores, main = "Boxplot para cada condición", xlab = "Condiciones", ylab = "Valores") 
 
# Para crear la leyenda para identificar los colores de cada condición que se representa en cada Boxplot 
legend("topright", legend = names(colores), fill = colores, title = "Condiciones") 
 
# Para hacer un boxplot individual para cada condicion:
 
# Tratamiento:
boxplot(datos$Tratamiento, col = colores["Tratamiento"], main = "Boxplot - Tratamiento", ylab = "Valores")
 
# Wildtype:
boxplot(datos$Wildtype, col = colores["Wildtype"], main = "Boxplot - Wildtype", ylab = "Valores")
 
# Sequia:
boxplot(datos$Sequia, col = colores["Sequia"], main = "Boxplot - Sequia", ylab = "Valores")

# ExcesoRiego:
boxplot(datos$ExcesoRiego, col = colores["ExcesoRiego"], main = "Boxplot - ExcesoRiego", ylab = "Valores")

# Para crear un gráfico conjunto que compare las tres condiciones (Wildtype, Sequia, ExcesoRiego), sin incluir el tratamiento:
boxplot(datos$Wildtype, datos$Sequia, datos$ExcesoRiego, names = c("Wildtype", "Sequia", "ExcesoRiego"), col = colores, main = "Boxplot para cada condición", xlab = "Condiciones", ylab = "Valores") 

 
#  Pregunta 3: Haz dos gráficos de dispersión. El primero debe comparar Sequía con Wildtype, y el segundo ExcesoRiego con Wildtype. Cada tratamiento debe ir de un color distinto. Pista: usa col = datos$Tratamiento.

# Primero se tiene que asignar un color para cada tratamiento
colores_tratamiento = c("Tto 1" = "orange", "Tto 2" = "red", "Tto 3" = "lightgreen", "Tto 4" = "lightblue", "Tto 5" = "purple", "Tto 6" = "lightpink")

# Para crear el primer gráfico de dispersión: Sequia vs Wildtype
plot(datos$Wildtype, datos$Sequia, col = colores_tratamiento[datos$Tratamiento], pch = 1, xlab = "Wildtype", ylab = "Sequia", main = "Gráfico de Dispersión: Sequia vs Wildtype")

# Para crear el segundo gráfico de dispersión: ExcesoRiego Vs Wildtype
plot(datos$Wildtype, datos$ExcesoRiego, col = colores_tratamiento[datos$Tratamiento], pch = 1, xlab = "Wildtype", ylab = "ExcesoRiego", main = "Gráfico de Dispersión: ExcesoRiego vs Wildtype")


# Pregunta 4: Ponle leyenda al gráfico del apartado anterior. En el margen inferior derecho. Pista: investiga sobre legend().

# Para añadir una leyenda a los gráficos:
legend("bottomright", legend = names(colores_tratamiento), fill = colores_tratamiento, title = "Tratamiento")


# Pregunta 5: Haz un histograma para cada variable. Recuerda mantener los colores.

# Para crear el histograma para la variable Tratamiento:
hist(datos$Tratamiento, col = colores["Tratamiento"], main = "Histograma - Tratamiento", xlab = "Tratamiento", ylab = "Frecuencia")

# Para crear el histograma para la variable Wildtype:
hist(datos$Wildtype, col = colores["Wildtype"], main = "Histograma - Wildtype", xlab = "Wildtype", ylab = "Frecuencia")

# Para crear el histograma para la variable Sequia:
hist(datos$Sequia, col = colores["Sequia"], main = "Histograma - Sequia", xlab = "Sequia", ylab = "Frecuencia")

# Para una versión más visual de esta viariable (Sequia). Como presenta valores tan pequeños se puede poner en escala logarítmica: 
hist(log1p(datos$Sequia), col = colores["Sequia"], main = "Histograma - Sequia", xlab = "log(Sequia +1)", ylab = "Frecuencia", breaks = 5)

# Para crear el histograma para la variable ExcesoRiego:
hist(datos$ExcesoRiego, col = colores["ExcesoRiego"], main = "Histograma - ExcesoRiego", xlab = "ExcesoRiego", ylab = "Frecuencia")


#Pregunta 6: Haz un factor en la columna tratamiento y guárdalo en una variable. Pista: factor(factor$Tratamiento).

# Para crear el factor a partir de la columna Tratamiento:
factor_tratamiento = factor(datos$Tratamiento)

# Para poder verificarlo: 
factor_tratamiento


# Pregunta 7: Calcula la media y la desviación estándar para cada tratamiento. Recomendación: es más fácil si usas aggregate() o tappy().

# Para calcular la media para cada tratamiento con aggregate():
media_por_tratamiento = aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, data = datos, FUN = mean)

# Para poder verificarlo:
print("Media por Tratamiento:")
media_por_tratamiento

# Para calcular la desviación estándar para cada tratamiento con aggregate():
sd_por_tratamiento = aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, data = datos, FUN = sd)

# Para poder verificarlo:
print("Deviación Estándar por Tratamiento:")
sd_por_tratamiento

#Para calcular la media y desviación estándar para Wildtype con tapply():
media_wildtype = tapply(datos$Wildtype, datos$Tratamiento, mean)
sd_wildtype = tapply(datos$Wildtype, datos$Tratamiento, sd)
print("Media y Desviación Estándar para Wildtype:")
print(data.frame(Tratamiento = names(media_wildtype), Media = media_wildtype, SD = sd_wildtype))

#Para calcular la media y desviación estándar para Sequia con tapply():
media_sequia = tapply(datos$Sequia, datos$Tratamiento, mean)
sd_sequia = tapply(datos$Sequia, datos$Tratamiento, sd)
print("Media y Desviación Estándar para Sequia:")
print(data.frame(Tratamiento = names(media_sequia), Media = media_sequia, SD = sd_sequia))

#Para calcular la media y desviación estándar para ExcesoRiego con tapply():
media_exceso_riego = tapply(datos$ExcesoRiego, datos$Tratamiento, mean)
sd_exceso_riego = tapply(datos$ExcesoRiego, datos$Tratamiento, sd)
print("Media y Desviación Estándar para ExcesoRiego:")
print(data.frame(Tratamiento = names(media_exceso_riego), Media = media_exceso_riego, SD = sd_exceso_riego))


# Pregunta 8: Averigua cúantos elementos tiene cada tratamiento. Recomendación: es más fácil si usas table() con el factor.

# Para contar los elementos usando table() con el factor de tratamiento:
conteo_tratamiento = table(factor_tratamiento)

# Para poder verificarlo: 
print("Número de elementos por tratamiento:")
conteo_tratamiento

# Los tratamientos del 1 al 5 tienen 10 elementos y el tratamiento 6 solo muestra 5 elementos.


# Pregunta 9: Extrae los datos para el tratamiento 1 y el tratamiento 4 y guárdalos cada uno en una variable diferente. 

# Para extraer los datos del tratamiento 1 y gardarlos en una variable:
datos_tratamiento_1 = subset(datos, grepl("1", Tratamiento))

# Para extraer los datos del tratamiento 4 y guardarlos en una variable:
datos_tratamiento_4 = subset(datos, grepl("4", Tratamiento))

# Para poder verificarlo: 
print("Datos para el Tratamiento 1:")
datos_tratamiento_1

print("Datos para el Tratamiento 4:")
datos_tratamiento_4


# Pregunta 10: Queremos comprobar que hay diferencias significativas para el tratamiento 1 y el tratamiento 5 entre Wildtype y ExcesoRiego. Primero, necesitaríamos comprobar si los datos se distribuyen de forma normal. En función de los resultados de la prueba de normalidad, ¿qué test usarías para cada prueba? ¿Puedes comparar también Sequia con ExcesoRiego en ambos tratamientos? ** En general, asumimos que las muestras son independientes, pero ¿son sus varianzas iguales? Actúa de acuerdo con tus resultados.

# Los datos del tratamiento 1 ya está guardado en la variable "datos_tratamiento_1". Para hacer lo mismo con los datos deltratamiento 5
datos_tratamiento_5 = subset(datos, grepl("5", Tratamiento))

# Para verificar los resultados:
print("Datos para el Tratamiento 5:")
datos_tratamiento_5

# Para comprobar si los datos de Wildtype, Sequia y ExcesoRiego en Tratamiento 1, siguen una distribución normal se utiliza la prueba de ShapiroWilk 
shapiro_wildtype_t1 = shapiro.test(datos_tratamiento_1$Wildtype)
shapiro_sequia_t1 = shapiro.test(datos_tratamiento_1$Sequia)
shapiro_excesoriego_t1 = shapiro.test(datos_tratamiento_1$ExcesoRiego)

# Para verificar los resultados y obtener los p-values:
shapiro_wildtype_t1 # El p-value obtenido es 0,06434

shapiro_sequia_t1 # El p-value obtenido es 0,1088

shapiro_excesoriego_t1 # El p-value obtenido es 0,4357


# Para comprobar si los datos de Wildtype, Sequia y ExcesoRiego en Tratamiento 5, siguen una distribución normal se utiliza la prueba de ShapiroWilk 
shapiro_wildtype_t5 = shapiro.test(datos_tratamiento_5$Wildtype)
shapiro_sequia_t5 = shapiro.test(datos_tratamiento_5$Sequia)
shapiro_excesoriego_t5 = shapiro.test(datos_tratamiento_5$ExcesoRiego)

# Para verificar los resultados y obtener los p-values:
shapiro_wildtype_t5 # El p-value obtenido es 0,006709

shapiro_sequia_t5 # El p-value obtenido es 0,003361

shapiro_excesoriego_t5 # El p-value obtenido es 0,1411

# Si los p-values de este test son mayores a 0,05, los datos de esa variable y tratamiento pueden considerarse que siguen una distribución normal.

# Si loz p-values son menores a 0,05, los datos no siguen una distribución normal.


# Para poder ver las comparaciones paramétricas y despúes proceder a decidir que tipo de test utilizar para ver si hay diferencias significativas, hay que ver si las varianzas de los grupos son iguales:
if(!require(car)) install.packages("car")
library(car)

# Para calcular si las varianzas de los grupos Wildtype y Sequia son iguales hay que organizar primeros los datos en un solo vector y utilizar un factor para indicar el grupo de cada valor. De esta forma se puede hacer la prueba correctamente.

# Para crear el vector combinado los datos Wildtype con los de Sequia para el tratamiento 1:
wildtype_sequia_t1 = c(datos_tratamiento_1$Wildtype, datos_tratamiento_1$Sequia)

# Para crear un factor que indique el grupo Wildtype o Sequia a los cuales pertenece cada valor en wildtype_sequia_1:
grupo_sequia_t1 = factor(c(rep("Wildtype", length(datos_tratamiento_1$Wildtype)), rep("Sequia", length(datos_tratamiento_1$Sequia))))

# Para obtener la comparación de varianzas de los grupos Wildtype y Sequia del tratamiento 1 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(wildtype_sequia_t1 ~ grupo_sequia_t1) # El p-value (Pr(>F)) es 0,003935.


# Para crear el vector combinado los datos Wildtype con los de ExcesoRiego para el tratamiento 1:
wildtype_excesoriego_t1 = c(datos_tratamiento_1$Wildtype, datos_tratamiento_1$ExcesoRiego)

# Para crear un factor que indique el grupo Wildtype o ExcesoRiego a los cuales pertenece cada valor en wildtype_excesoriego_1:
grupo_excesoriego_t1 = factor(c(rep("Wildtype", length(datos_tratamiento_1$Wildtype)), rep("ExcesoRiego", length(datos_tratamiento_1$ExcesoRiego))))

# Para obtener la comparación de varianzas de los grupos Wildtype y ExcesoRiego del tratamiento 1 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(wildtype_excesoriego_t1 ~ grupo_excesoriego_t1) # El p-value (Pr(>F)) es 0,01416.


# Para crear el vector combinado los datos Sequia con los de ExcesoRiego para el tratamiento 1:
sequia_excesoriego_t1 = c(datos_tratamiento_1$Sequia, datos_tratamiento_1$ExcesoRiego)

# Para crear un factor que indique el grupo Sequia o ExcesoRiego a los cuales pertenece cada valor en sequia_excesoriego_1:
grupo_sequia_excesoriego_t1 = factor(c(rep("Sequia", length(datos_tratamiento_1$Sequia)), rep("ExcesoRiego", length(datos_tratamiento_1$ExcesoRiego))))

# Para obtener la comparación de varianzas de los grupos Sequia y ExcesoRiego del tratamiento 1 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(sequia_excesoriego_t1 ~ grupo_sequia_excesoriego_t1) # El p-value (Pr(>F)) es 0,1851.


# Para crear el vector combinado los datos Wildtype con los de Sequia para el tratamiento 5:
wildtype_sequia_t5 = c(datos_tratamiento_5$Wildtype, datos_tratamiento_5$Sequia)

# Para crear un factor que indique el grupo Wildtype o Sequia a los culaes pertenece cada valor en wildtype_sequia_5:
grupo_sequia_t5 = factor(c(rep("Wildtype", length(datos_tratamiento_5$Wildtype)), rep("Sequia", length(datos_tratamiento_5$Sequia))))

# Para obtener la comparación de varianzas de los grupos Wildtype y Sequia del tratamiento 5 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(wildtype_sequia_t5 ~ grupo_sequia_t5) # El p-value (Pr(>F)) es 0,1461.


# Para crear el vector combinado los datos Wildtype con los de ExcesoRiego para el tratamiento 5:
wildtype_excesoriego_t5 = c(datos_tratamiento_5$Wildtype, datos_tratamiento_5$ExcesoRiego)

# Para crear un factor que indique el grupo Wildtype o ExcesoRiego a los cuales pertenece cada valor en wildtype_excesoriego_5:
grupo_excesoriego_t5 = factor(c(rep("Wildtype", length(datos_tratamiento_5$Wildtype)), rep("ExcesoRiego", length(datos_tratamiento_5$ExcesoRiego))))

# Para obtener la comparación de varianzas de los grupos Wildtype y Sequia del tratamiento 5 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(wildtype_excesoriego_t5 ~ grupo_excesoriego_t5) # El p-value (Pr(>F)) es 0,2918.


# Para crear el vector combinado los datos Sequia con los de ExcesoRiego para el tratamiento 5:
sequia_excesoriego_t5 = c(datos_tratamiento_5$Sequia, datos_tratamiento_5$ExcesoRiego)

# Para crear un factor que indique el grupo Sequia o ExcesoRiego a los cuales pertenece cada valor en sequia_excesoriego_5:
grupo_sequia_excesoriego_t5 = factor(c(rep("Sequia", length(datos_tratamiento_5$Sequia)), rep("ExcesoRiego", length(datos_tratamiento_5$ExcesoRiego))))

# Para obtener la comparación de varianzas de los grupos Wildtype y ExcesoRiego del tratamiento 5 se utiliza leveneTest con el vector combinado y el factor de grupo:
leveneTest(sequia_excesoriego_t5 ~ grupo_sequia_excesoriego_t5) # El p-value (Pr(>F)) es 0,1545.

# Si el p-value es mayor a 0.05; se considera que las varianzas son iguales, pero si son menores a 0.05; las varianzas se consideran desiguales.


# Para la selección del test que permite realizar las comparaciones estadísticas, se tiene en cuenta los siguientes criterios: 1. Si ambas variables presentan una distribución normal, se utiliza t.test; pero si las varianzas son iguales hay que marcar que var.equal = TRUE. En cambio si las varianzas no son iguales, el var.equal = FALSE. 2. Si alguna de las variables o ambas no siguen una distribución normal, se utiliza el wilcox.test. 

# Para la selección del test Wildtype vs Sequia en Tratamiento 1 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar. 

# El resultado del p-value del test de distribución normal obtenido para Wildtype en Tratamiento 1 es 0,06434. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para Sequia en Tratamiento 1 es 0,1088. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Wildtype-Sequia en Tratamiento 1 es 0,003935. El valor es inferior a 0,05, por lo que las varianzas se consideran desiguales.

# Por lo tanto se obtiene que ambas variables siguen una distribución normal, pero sus varianzas son desiguales. El test idóneo para Wildtype vs Sequia en Tratamiento 1 es el t.test con un var.equal = FALSE.
t.test(datos_tratamiento_1$Wildtype, datos_tratamiento_1$Sequia, var.equal = FALSE) # El p-value es 8,642e-06.


# Para la selección del test Wildtype vs ExcesoRiego en Tratamiento 1 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar. 

# El resultado del p-value del test de distribución normal obtenido para Wildtype en Tratamiento 1 es 0,06434. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para ExcesoRiego en Tratamiento 1 es 0,4357. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Wildtype-ExcesoRiego en Tratamiento 1 es 0,01416. El valor es inferior a 0,05, por lo que las varianzas se consideran desiguales.

# Por lo tanto se obtiene que ambas variables siguen una distribución normal, pero sus varianzas son desiguales. El test idóneo para Wildtype vs ExcesoRiego en Tratamiento 1 es el t.test con un var.equal = FALSE.
t.test(datos_tratamiento_1$Wildtype, datos_tratamiento_1$ExcesoRiego, var.equal = FALSE) # El p-value es 0,0007938.


# Para la selección del test Sequia vs ExcesoRiego en Tratamiento 1 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar.

# El resultado del p-value del test de distribución normal obtenido para Sequia en Tratamiento 1 es 0,1088. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para ExcesoRiego en Tratamiento 1 es 0,4357. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Sequia-ExcesoRiego en Tratamiento 1 es 0,1851. El valor es superior a 0,05, por lo que las varianzas se consideran iguales.

# Por lo tanto se obtiene que ambas variables siguen una distribución normal y sus varianzas son iguales. El test idóneo para Sequia vs ExcesoRiego en Tratamiento 1 es el t.test con un var.equal = TRUE.
t.test(datos_tratamiento_1$Sequia, datos_tratamiento_1$ExcesoRiego, var.equal = TRUE) # El p-value es < 2,2e-16.


# Para la selección del test Wildtype vs Sequia en Tratamiento 5 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar.

# El resultado del p-value del test de distribución normal obtenido para Wildtype en Tratamiento 5 es 0,006709. El valor es inferior a 0,05, por lo que estos datos no siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para Sequia en Tratamiento 5 es 0,003361. El valor es inferior a 0,05, por lo que estos datos no siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Wildtype-Sequia en Tratamiento 5 es 0,1461. El valor es superior a 0,05, por lo que las varianzas se consideran iguales.

# Por lo tanto se obtiene que ninguna de las variables sigue una distribución normal y sus varianzas son iguales. El test idóneo para Wildtype vs Sequia en Tratamiento 5 es el wilcox.test.
wilcox.test(datos_tratamiento_5$Wildtype, datos_tratamiento_5$Sequia, exact = FALSE) # El p-value es 0,0001575. # Se añade el argumento exact = FALSE para que no salte el error "cannot compute exact p-value ties" porque este test no puede calcular un p-value exacto cuando hay valores idénticos en las dos muestras se están comparando. Este argumento hace que se calcule un valor aproximado.


# Para la selección del test Wildtype vs ExcesoRiego en Tratamiento 5 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar. 

# El resultado del p-value del test de distribución normal obtenido para Wildtype en Tratamiento 5 es 0,006709. El valor es inferior a 0,05, por lo que estos datos no siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para ExcesoRiego en Tratamiento 5 es 0,1411. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Wildtype-ExcesoRiego en Tratamiento 5 es 0,2918. El valor es superior a 0,05, por lo que las varianzas se consideran iguales.

# Por lo tanto se obtiene que una de las variables sigue una distribución normal y la otra no y sus varianzas son iguales. El test idóneo para Wildtype vs ExcesoRiego en Tratamiento 5 es el wilcox.test.
wilcox.test(datos_tratamiento_5$Wildtype, datos_tratamiento_5$ExcesoRiego, exact = FALSE) # El p-value es 0,0001621.


# Para la selección del test Sequia vs ExcesoRiego en Tratamiento 5 se van a mostrar los resultados de las pruebas de distribución normal y varianzas y según éstos se decidirá que test realizar.

# El resultado del p-value del test de distribución normal obtenido para Sequia en Tratamiento 5 es 0,003361. El valor es inferior a 0,05, por lo que estos datos no siguen una distribución normal.

# El resultado del p-value del test de distribución normal obtenido para ExcesoRiego en Tratamiento 5 es 0,1411. El valor es superior a 0,05, por lo que estos datos siguen una distribución normal.

# El resultado del p-value del test de comparación de varianzas obtenido para Sequia-ExcesoRiego en Tratamiento 5 es 0,1545. El valor es superior a 0,05, por lo que las varianzas se consideran iguales.

# Por lo tanto se obtiene que una de las variables sigue una distribución normal y la otra no y sus varianzas son iguales. El test idóneo para Riego vs ExcesoRiego en Tratamiento 5 es el wilcox.test.
wilcox.test(datos_tratamiento_5$Sequia, datos_tratamiento_5$ExcesoRiego, exact = FALSE) # El p-value es 0,0001776.

# Si el p-value obtenido de las pruebas t.test y wilcox.test es menor a 0.05, hay una diferencia significativa entre los grupos; si es mayor o igual a 0.05, no existiría una diferencia significativa.


# Pregunta 11: Realiza un ANOVA para comparar el tratamiento 1 en tres condiciones. Pista: primero separa los valores de tratamiento1 en Wildtype, Sequia y ExcesoRiego en variables separadas. Luego fíjateen el archivo "datos-anova.txt" y trata de colocar los datos de esa forma en una tabla. Por úlyimo, ejecuta el test. 

# Para separar los valores del Tratamiento 1 para cada condición en variables separadas:
wildtype_t1 = datos_tratamiento_1$Wildtype
sequia_t1 = datos_tratamiento_1$Sequia
excesoriego_t1 = datos_tratamiento_1$ExcesoRiego

# Para crear la tabla de datos en formato adecuado para realizar el ANOVA posteriormente:
datos_anova = data.frame(Condicion = rep(c("Wildtype", "Sequia", "ExcesoRiego"), times = c(length(wildtype_t1), length(sequia_t1), length(excesoriego_t1))), Valor = c(wildtype_t1, sequia_t1, excesoriego_t1))

# Para poder verificar la tabla:
datos_anova

# Para realizar el test ANOVA:
anova_resultado = aov(Valor ~ Condicion, data = datos_anova)

# Para mostrar el resumen del ANOVA:
summary(anova_resultado) # El p-value (Pr(>F)) es 4,19e-14.

# Si el p-value obtenido de la prueba ANOVA es menor a 0.05, hay una diferencia significativa entre al menos dos de las condiciones; si es mayor o igual a 0.05, no existiría una diferencia significativa.En este caso si existe una diferencia significativa 
