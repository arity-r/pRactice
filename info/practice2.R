
#' Practice 2
#' Flip a coin many times and
#' find average information quantity (entropy)

I = function(p) -log2(p)

n = 1000
head_probability = seq(0, 1, 0.001)
entropy = c()

for (hp in head_probability) {
  coin = runif(n, min=0, max=1)
  head_p = length(coin[coin < hp]) / n
  tail_p = length(coin[coin > hp]) / n
  entropy = c(entropy, head_p*I(head_p) + tail_p*I(tail_p))
}

plot(head_probability, entropy, type='l')
