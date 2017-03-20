rm (list = ls())
# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if (!require("testthat"))
  install.packages("testthat")
library(testthat)


# Loading functions
source("sourceAll.R")



test_results <- test_dir('tests', reporter = 'Summary')
test_results
