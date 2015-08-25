
#' Practice 4.5
#' Simulate entropy and draw entropy function of
#'   H(f(p)) = -f(p)*log2(f(p)) -(1-f(p)*log2(1-f(p)))
#' where f(p) is step function, 0<=f(p)<=1

f = function(x) 1/8 * floor(8*x)
I = function(p) -log2(p)
p = seq(0, 1, 1/1000)

par(mfrow=c(2,1))

# 1. simulation part
H = function(p) {
  if(length(p) == 1) {
    N = 1000
    s = sample(c(T,F), N, replace=T, prob=c(p,1-p))
    p = length(which(s))/N
    q = length(which(!s))/N
    return(p*I(p)+q*I(q))
  } else {
    return(sapply(p, H))
  }
}
plot(f(p), H(f(p)), type='p', cex=0.1, main='Simulation')

# 2. plot entropy function
H = function(p) -p*log2(p)-(1-p)*log2(1-p)
plot(f(p), H(f(p)), type='l', main='Theoretical')

par(mfrow=c(1,1))