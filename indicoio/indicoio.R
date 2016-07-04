install.packages("devtools")
install.packages("fftwtools")

source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")

library(devtools)
devtools::install_github("IndicoDataSolutions/IndicoIo-R")

library(indicoio)

# single example
sentiment_hq(
  "I love writing code!",
  api_key = ''
)

# batch example
sentiment_hq(
  c(
    "I love writing code!",
    "Alexander and the Terrible, Horrible, No Good, Very Bad Day"
  ),
  api_key = ''
)