library(FNN)
eval_train = 500
eval_test = 500

#train data
set.seed(123)
train_x = sort(rnorm(eval_train))
train_y = 3+train_x^2 + rnorm(eval_train)

#test data
set.seed(1234)
test_x = sort(rnorm(eval_test))
test_y = 3+test_x^2 + rnorm(eval_test)

eval_point = test_x
dist = rep(0,length = 30)
hat_y = c()

#k for loop
for(k.n in 1:length(dist)){

  #hat_y
  idx = knnx.index(train_x,eval_point,k = k.n)
  for(i in 1:eval_test) hat_y[i] = mean(train_y[idx[i,]])

  #distance
  dist[k.n] = mean((test_y - hat_y)^2)
}
#dist plot
plot(dist)

#valid_k
valid_k = which(dist == min(dist))
valid_k


