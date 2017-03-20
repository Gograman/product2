createBetaArrayReplicated <- function(originalReplicated,
                                      size,
                                      replicationCount) {
  betaArrayReplicated <- apply(X = originalReplicated,
                               MARGIN = 1,
                               FUN = createBetaArray)
  betaArrayReplicated <- array(as.numeric(unlist(betaArrayReplicated)),
        dim=c(size, size, replicationCount))
}