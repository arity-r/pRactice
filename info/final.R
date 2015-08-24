
#' From e. coli, strain K-12, read DNA sequence and
#' slide a windows over the genome,
#' estimate the entropy within the window
#' 
#' * size of window -> 6561 (=3^8)
#' * size of steps slid in window -> 81 (=3^4)
#' 

filename = '1_4639211_1.txt'

dna = c('A', 'C', 'G', 'T')
sequence = readLines(filename)
sequence = sequence[2:length(sequence)] # pass first line
sequence = unlist(strsplit(sequence, split='')) # split each DNA

size_window = 3^8
size_slid   = 3^4

# HARD WAY
# make windows given sequence with order as length and slid amount
slice_sequence = function(sequence, order=1, slid=1) {
  wslice = sapply(seq(1, length(sequence)-order+1, slid),
                  function(i) paste(sequence[i:(i+order-1)], collapse=''))
  return(wslice)
}

# simply, entropy function
entropy_func = function(e) {
  e = e[!is.na(e)]
  p = e / sum(e)
  return(sum(-1 * p * log2(p)))
}

# count dna components in given dna sequence
count_dna = function(sequence, order=3) {
  subseq = unlist(strsplit(sequence, NULL))
  seq_dna = slice_sequence(subseq, order=3)
  count = sapply(setdiff(seq_dna, c()), function(x) sum(!is.na(match(seq_dna, x))))
  return(count)
}

# calculate entropy of e coli dna sequence
dna_slice = slice_sequence(sequence, order=size_window, slid=size_slid)
count = lapply(dna_slice, count_dna)
entropy = rapply(count, entropy_func)

# create random dna sequence and calculate entropy
sequence_r = sample(dna, length(sequence), replace=T)
dna_slice_r = slice_sequence(sequence_r, order=size_window, slid=size_slid)
count_r = lapply(dna_slice_r, count_dna)
entropy_r = rapply(count_r, entropy_func)

plot(1:length(entropy), entropy, type='l', ylim=c(min(entropy), 6))
lines(1:length(entropy_r), entropy_r, type='l')

# EASY WAY
if(1==0) {

i = 1
y = c()
while(i <= length(sequence) - size_window) {
  # obtain subsequence
  subseq = sequence[i:(i+size_window)]
  
  # count DNA
  count = c()
  for(j in 1:(length(subseq)-3)) {
    subsubseq = subseq[j:(j+2)]
    subsubseq = paste(subsubseq, collapse='')
    if(length(count) == 0 || is.na(count[subsubseq])) # WARNING: hacky way
      count[subsubseq] = 0
    count[subsubseq] = count[subsubseq] + 1
  }
  
  # calculate entropy
  entropy = 0
  for(e in count) {
    p = e / size_window
    if(p > 0)
      entropy = entropy - p * log2(p)
  }
  y = c(y, entropy) # append
  
  # increase header
  i = i + size_slid
}
x = 1:length(y)

plot(x, y, type='l')

}