
#' Practice 3
#' Draw a graph of H(p) = -p*log2(p) - (1-p)*log2(1-p)
#' c.f. practice2

p = seq(0, 1, 0.001)
H = -p*log2(p) - (1-p)*log2(1-p)

plot(p, H, type='l', main='H(p) = -p*log2(p) - (1-p)*log2(1-p)')
