#Las ventas diarias de un supermercado siguen una distribución normal, con media 9000 euros y desviación estándar 2000 euros.
media = 9000
std_deviation = 2000

#Realiza la gráfica de la función de densidad de las ventas diarias.
x1 = 0:20000
f1 = dnorm(x1, mean = media, sd = std_deviation);
plot(x1, f1, col="red", lwd=3)

#Realiza la gráfica de la función de distribución de las ventas diarias.
F1 = pnorm(x1, mean=media, sd=std_deviation, lower.tail = TRUE)
plot(x1, F1, type="s", col="red", lwd=3)

#Calcula la probabilidad de que un día las ventas sean mas pequeñas que 10000 euros. Representa dicha probabilidad en la gráfica de la función de distribución.
#F1[10000+1] es el 10000 ya que es continuo, seria el limite x la izq que toca a 10000
pnorm(10000, mean=media, sd=std_deviation)
points(10000, pnorm(10000, mean=media, sd=std_deviation), col="blue", lwd=3)

#Calcula la probabilidad de que un día las ventas sean mayores de 12000 euros. Representa dicha probabilidad en la gráfica de la función de densidad.
1-pnorm(12000, mean=media, sd=std_deviation)

#Calcula la probabilidad de que un día las ventas se encuentren entre 7500 y 10000 euros. Representa dicha probabilidad en la gráfica de la función de densidad.
pnorm(10000, mean=media, sd=std_deviation) - pnorm(7500, mean=media, sd=std_deviation)

#Calcula la probabilidad de que un día las ventas sean exactamente de 7000 euros.
0 #en una dist normal, el valor exacto es 0

#El 90% de los días, las ventas superan un valor, ¿Cuál es ese valor?
qnorm(0.9, mean=media, sd=std_deviation, lower.tail = FALSE)

#El 30% de los días, las ventas no superan un valor, ¿Cuál es ese valor?
qnorm(0.3, mean=media, sd=std_deviation)
qnorm(0.3, mean=media, sd=std_deviation)

#Realiza 10000 simulaciones de las ventas diarias. (Utiliza como semilla el número 123)
set.seed(123)
simX = rnorm(10000, mean=media, sd=std_deviation)

#Representa gráficamente la frecuencia de los resultados obtenidos y compáralo con el diagrama de la función de densidad.
hist(simX, freq = FALSE)
curve(dnorm(x, mean=media, sd=std_deviation), col="red", lwd=3, add=TRUE)

#¿Cuál es el valor de la media de los resultados de las simulaciones?
mean(simX)

#¿Cuál es la mediana de los resultados de las simulaciones?
median(simX)

#¿Cuál es la desviación típica de los resultados de las simulaciones?
#sqrt(var(simX))
sd(simX)

#Compara los últimos valores calculados (estadísticos) con los parámetros de la función de distribución.

