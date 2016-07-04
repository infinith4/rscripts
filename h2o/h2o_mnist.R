# MNISTのトレーニングデータ読み込み
train <- read.csv("h2o/mnist/train.csv")
library(nnet)

# MNISTのトレーニングデータ読み込み
train <- read.csv("h2o/mnist/train.csv")
train[,"label"] <- as.factor(train[,"label"])

# 42000件のデータを40000件のトレーニングデータと2000件のテストデータに分割
training.index <- 1:40000
mnist.train <- train[training.index,]
mnist.test <- train[-training.index,]

# トレーニングデータをニューラルネットで学習
mnist.nnet <- nnet(label ~ ., size=3, data=mnist.train, MaxNWts=4000)

# テストデータを使って評価
mnist.result <- predict(mnist.nnet, mnist.test, type="class")
table(mnist.test$label, mnist.result, dnn = c("Actual", "Predicted"))

# テストデータの正解、予測を表示
range <- 1:20
view_train(mnist.test, range)
view_label(mnist.test, range)
matrix(mnist.result, 4, 5, byrow = TRUE)
