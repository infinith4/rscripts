library(h2o)

localH2O =  h2o.init()

MNIST_DIGITStrain = read.csv('h2o/mnist/train.csv')
par( mfrow = c(10,10), mai = c(0,0,0,0))
for(i in 1:100){
  y = as.matrix(MNIST_DIGITStrain[i, 2:785])
  dim(y) = c(28, 28)
  image( y[,nrow(y):1], axes = FALSE, col = gray(255:0 / 255))
  text( 0.2, 0, MNIST_DIGITStrain[i,1], cex = 3, col = 2, pos = c(3,4))
}

mfile = 'h2o/mnist/train.csv'
mfile = system.file("extdata", "h2o/mnist/train.csv", package="h2o")
mfile
#MDIG = h2o.importFile(path = mfile,sep=',')
MDIG = h2o.importFile(localH2O, path = mfile)

# Show the data objects on the H2O platform
h2o.ls()

NN_model = h2o.deeplearning(
  x = 2:785,
  training_frame = MDIG,
  hidden = c(400, 200, 2, 200, 400 ),
  epochs = 600,
  activation = 'Tanh',
  autoencoder = TRUE
)



train_supervised_features2 = h2o.deepfeatures(NN_model, MDIG, layer=3)

plotdata2 = as.data.frame(train_supervised_features2)
plotdata2$label = as.character(as.vector(MDIG[,1]))
library(ggplot2)
qplot(DF.L3.C1, DF.L3.C2, data = plotdata2, color = label, main = 'Neural network: 400 - 200 - 2 - 200 - 4000')


