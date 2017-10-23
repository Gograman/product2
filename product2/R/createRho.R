createRho <- function(size, psi) {
  rho = rep(0, length = size-1)
  # version 1
  rho [1] = 1
  rho [2] = psi / (1 + psi ^ 2)
  # version 2
  # rho [1] =  psi / (1 + psi ^ 2)
  rho
}
