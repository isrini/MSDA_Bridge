# 1. Write a loop that calculates 12-factorial.
fact <- function(x){
  x = 12
  y <- 1
  for(i in 1:x){
    y <-y*((1:x)[i])
    print(y)
  }
  
}

fact(12)

# 2. Show how to create a numeric vector that contains the sequence from 20 to 50 by 5
numVec <- c(20:50)
numVec[seq(1,length(numVec),5)]

# 3. Show how to take a trio of input numbers a, b, and c and implement the quadratic equation.

# solving x for the expression ax^2 + bx + c = 0
a <- 2
b <- 7
c <- 5
d <- sqrt((b^2 - 4*a*c))

# solvin x = (b+d)/2a
x <- (b + d)/2*a

# solving x1 = x = (b-d)/2a
x1 <- (b - d)/2*a

print(x)
print(x1)

