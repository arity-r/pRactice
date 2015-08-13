
#' Practice 1
#' Draw a graph of I(p) = -log2(p)

p = seq(0, 1, 0.001)
I = -log2(p)

plot(p, I, type='l', main='I(p) = -log2(p)')
