rm (list = ls())
# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
source("sourceAll.R")

if (!require("RUnit"))
  install.packages("RUnit")
library("RUnit")


testSuite <- defineTestSuite(name = "productDoubleArray Tests",
                             dirs = file.path("./runit_tests"),
                             testFuncRegexp = ".")
tests <- runTestSuite(testSuite) # Run tests
printTextProtocol(tests)
tests$`productDoubleArray Tests`
names (tests)
tests$productDoubleArray

  
