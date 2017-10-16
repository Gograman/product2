toy.noise1 <- ToyNoise1(n = 1,
                        Ns = 64,
                        model = list(),
                        theta = 0.05,
                        l1 = 1,
                        l2 = 4,
                        tau = 10)

toy.noise2 <- ToyNoise2(n = 1,
                        Ns = 64,
                        model = list(),
                        theta = 0.05,
                        l1 = 1,
                        l2 = 4,
                        tau = 10)


toy.noise3 <- ToyNoise3(n = 1,
                        Ns = 64,
                        model = list(),
                        theta = 0.05,
                        l1 = 1,
                        l2 = 4,
                        tau = 10)

toy.noise1$x
length(toy.noise1$x)
toy.noise1$y
length(toy.noise1$y)
toy.noise1$z
dim(toy.noise1$z)
plot(toy.noise1$y)
plot(toy.noise1$z)
plot(toy.noise1$z)

toy.noise2$x
length(toy.noise2$x)
toy.noise2$y
length(toy.noise2$y)
toy.noise2$z
length(toy.noise2$z)
plot(toy.noise2$y)
plot(toy.noise2$z)
plot(toy.noise2$z)

toy.noise3$x
length(toy.noise3$x)
toy.noise3$y
length(toy.noise3$y)
toy.noise3$z
length(toy.noise3$z)
plot(toy.noise3$y)
plot(toy.noise3$z)
plot(toy.noise3$z)

toy.signal <- ToySignal(ImRange = c(0, 1), NPixel = 64)
toy.signal$x
toy.signal$y
toy.signal$z
dim(toy.signal$z)

n <- 30
Data <- ToyNoise1(n = n)
Data$x
Data$y
Data$z
Data$z <- Data$z + rep(ToySignal()$z, n)
CopeSet <- ComputeCope(Z = Data,
                      level = 4/3, 
                      mu = ToySignal()$z)
PlotCope(CopeSet)
## End(Not run)
