
filename = 'Genetic algorithm.txt'
order = 2 # means two words as a group

# word number of generated text (practice 5)
n = 50

words = scan(filename, character(0), quiet=T, quote='', encoding='UTF-8')
words = words[!is.na(words)] # omit NA
words = gsub('[[:punct:]]', '', words) # omit metacharacters
words = words[nchar(words)>0] # omit length < 1
words = tolower(words) # convert to lower case

slice_sequence = function(sequence, order=1) {
  wslice = numeric(0)
  for (i in 1:(length(sequence)-order+1)) {
    wslice[i] = paste(sequence[i:(i+order-1)], collapse=' ')
  }
  return(wslice)
}

count_table = function(sequence, order=1) {
  wnames = sort(union(sequence, c()))
  
  # making slice of sequence
  wslice = numeric(0)
  for (i in 1:(length(sequence)-order+1)) {
    wslice[i] = paste(sequence[i:(i+order-1)], collapse=' ')
  }
  
  words = numeric(0)
  count = numeric(0)
  for (w in wslice) {
    i = match(w, words)
    if (is.na(i)) { # new entry
      i = length(count)+1
      words[i] = w
      count[i] = 0
    }
    count[i] = count[i] + 1
  }
  o = order(count, words, decreasing=T)
  words = words[o]
  count = count[o]
  
  # we use strings instead of factors
  t = default.stringsAsFactors()
  options(stringsAsFactors=F)
  result = data.frame(Words=words, Count=count)
  options(stringsAsFactors=t)
  return(result)
}

wtable=count_table(words, order=order)
#wtable[1:10,] # 10 most frequent words

# practice 5 start here.
# create first order words
text = unlist(strsplit(wtable$Words[1], split=' ', fixed=T))

for (i in 1:(n-order)) {
  if (order == 1) {
    pattern = '^' # 'cuz there's no previous words
  } else {
    # pick last (order-1) words
    pattern = text[(length(text)-order+2):length(text)]
    pattern = paste(pattern, collapse=' ')
    pattern = paste(c('^', pattern), collapse='')
  }
  # pro tip: '^' means 'head' in regular expression
  match_idx = grepl(pattern, wtable$Words)
  # we pick up a word from...
  candidate = wtable$Words[match_idx]
  # weight vector for sample function
  prob = wtable$Count[match_idx]
  
  # then, pick up word and append
  wnext = sample(candidate, 1, prob=prob)
  wnext = unlist(strsplit(wnext, ' ', fixed=T))[order]
  text = c(text, wnext)
}

print(paste(text, collapse=' '))
