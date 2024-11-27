#Durante la segunda guerra mundial, 535 bombas fueron lanzadas sobre el sur de Londres. Esta área ha sido dividida en una cuadrícula de 576 pequeños cuadrados de 0,25 metros cuadrados cada uno. 
#Asumiendo que el objetivo es aleatorio: cada bomba impacta en un solo lugar a la vez, cada lugar tiene la misma probabilidad de ser impactada y, los impactos son sucesos independientes.
#Si queremos analizar el número de bombas que impactan en un cuadrado en particular.

#¿Qué modelo de distribución sigue dicha variable?
#Distribuición de possion

#Realiza la gráfica de su función de densidad
x = 0:6
bombas= 535
cuadrados = 576
lambda = bombas/cuadrados
f1 = dpois(x, lambda)
plot(x, f1, type="h", col="red", lwd=3)
points(x, f1, col="red", lwd=5)

#Realiza la gráfica de su función de distribución
F1 = ppois(x, lambda) 
plot(x, F1, type="s", col="red", lwd=3)
points(x, F1, col="red", lwd=5)

#¿Cuál es la probabilidad de que exactamente 2 bombas impacten en una zona en particular?
#f1[2+1] # index empieza en 1
dpois(2,lambda)

#¿Cuál es la probabilidad de que una zona concreta sea bombardeada (al menos caiga una bomba)?
# P(al menos 1) = 1 - P(0)
1- dpois(0, lambda)

#Si queremos analizar el número de zonas que reciben exactamente 2 impactos.
prob_2imp = dpois(2, lambda)
num_2imp = prob_2imp * cuadrados

#¿Qué modelo de distribución sigue dicha variable?
#distribución binomial

#Realiza la gráfica de su función de densidad (Manipula los límites de los ejes hasta encontrar una gráfica apreciable)
x2 = 0:576
f2 = dbinom(x2, size=cuadrados, prob = prob_2imp)
plot(x2, f2, type="h", col="red", lwd=3, xlim = c(50, 150), ylim=c(0,0.05))
points(x2, f2, col="red", lwd=5)

#Realiza la gráfica de su función de distribución
F2 = pbinom(x2, size=cuadrados, prob=prob_2imp)
plot(x2, F2, type="s", col="red", lwd=3)
points(x2, F2, col="red", lwd=5)

#¿Cuál es la probabilidad de que menos de 100 zonas reciban exactamente 2 impactos?
pbinom(99, size = cuadrados, prob=prob_2imp)

#¿Cuántas zonas se espera que sufran exactamente dos impactos?
cuadrados*prob_2imp

#Si queremos analizar el número de zonas que deben ser inspeccionadas para encontrar 10 que hayan sido bombardeadas.

#¿Qué modelo de distribución sigue dicha variable?
#Binomial negativa

#Realiza la gráfica de su función de densidad (Manipula los límites de los ejes hasta encontrar una gráfica apreciable)
p_bomba = 1 - dpois(0, lambda)
exitos = 10
x3 = exitos:50
f3 = dnbinom(x3-exitos, size=exitos, prob=p_bomba)
plot(x3,f3,type="h", col="red", lwd=3)
points(x3, f3, col="red", lwd=5)

#¿Cuál es la probabilidad de que se deban inspeccionar al menos 20 zonas para encontrar 10 que hayan sido bombardeadas?
F3 = pnbinom(x3-exitos, size=exitos, prob=p_bomba)
#es igual a 1 - probabilidad acumulada hasta 19 
1- F3[9+1]

#¿Cuántas zonas han de ser inspeccionadas para encontrar 10 que hayan sido bombardeadas?

