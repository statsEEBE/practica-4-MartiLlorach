#Sea X la distancia en metros que recorre un animal desde el lugar donde nace hasta el primer territorio desocupado que encuentra. Según el artículo “Competition and dispersal from multiple nests” publicado en la revista científica Ecology, para las ratas canguro, la distancia X se puede modelar mediante una variable aleatoria con distribución exponencial con parámetro 0.01005

#Realiza la gráfica de la función de densidad de X
lambda = 0.01005
x = 0:1000
f1 = dexp(x, rate= lambda)
plot(x, f1, col="red", lwd=3)


#Realiza la gráfica de la función de distribución de X
F1 = pexp(x, rate = lambda, lower.tail = TRUE)
plot(x, F1, col="red", lwd=3)

#Calcula la probabilidad de que un animal recorra menos de 100 metros hasta encontrar el primer territorio desocupado. Representa dicha probabilidad en la gráfica de la función de distribución.
pexp(100, rate = lambda, lower.tail = TRUE)
points(100, pexp(100, rate = lambda, lower.tail = TRUE), col="blue", lwd=5)

#Calcula la probabilidad de que un animal recorra más de 80 pero menos de 110 metros hasta encontrar el primer territorio desocupado. Representa dicha probabilidad en la gráfica de la función de densidad.
pexp(110, rate = lambda, lower.tail = TRUE) - pexp(80, rate = lambda, lower.tail = TRUE)
plot(x, f1, col="red", lwd=3)
cord.x=c(80,seq(80,110,length=100),110) # Vector de vértices en x para elpolígono
cord.y=c(0,dexp(seq(80,110,length=100),rate=lambda),0) # Vector de vértices en y
polygon(cord.x, cord.y, col='skyblue')

#¿Cuál es el valor de la distancia mediana que recorre un animal desde el lugar donde nace hasta el primer territorio desocupado que encuentra?
qexp(0.5, rate=lambda)

#Realiza 10000 simulaciones de la distancia que recorre un animal. (Utiliza como semilla el número 123)
set.seed(123)
simu = rexp(10000, rate = lambda)

#Representa gráficamente la frecuencia de los resultados obtenidos y compáralo con el diagrama de la función de probabilidad.
hist(simu, freq = FALSE)
curve(dexp(x, rate= lambda), col="red", lwd=3, add=TRUE)

#¿Cuál es el valor de la media de los resultados de las simulaciones?
mean(simu)

#¿Cuál es la mediana de los resultados de las simulaciones?
median(simu)

#¿Cuál es la desviación típica de los resultados de las simulaciones?
sd(simu)
