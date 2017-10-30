# Clear the console
cat("\014")

# Check if the package is installed. If not, install the package
if(!require('fueleconomy')) {
  install.packages('fueleconomy')
  library(fueleconomy)
}

if(!require('psych')) {
  install.packages('psych')
  library(psych)
}

if(!require('ggplot2')) {
  install.packages('ggplot2')
  library(ggplot2)
}


vehiclesDF <- as.data.frame(fueleconomy::vehicles)

head(vehiclesDF)

nrow(vehiclesDF)

describe(vehiclesDF$hwy)

describe(vehiclesDF$cty)

table(vehiclesDF$class, useNA='ifany')

describeBy(vehiclesDF$hwy, group = vehiclesDF$class, mat=TRUE)

ggplot(vehiclesDF, aes(x=vehiclesDF$hwy)) + geom_histogram()

ggplot(vehiclesDF, aes(x=vehiclesDF$cty)) + geom_histogram()
