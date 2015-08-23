
filename = 'Genetic algorithm.txt'
order = 1 # means two words as a group

words = scan(filename, character(0), quiet=T, quote='', encoding='UTF-8')
words = words[!is.na(words)] # omit NA
words = gsub('[[:punct:]]', '', words) # omit metacharacters
words = words[nchar(words)>0] # omit length < 1
words = tolower(words) # convert to lower case

slice_sequence = function(sequence, order=1) {
  wslice = sapply(1:(length(sequence)-order+1),
                  function(i) paste(sequence[i:(i+order-1)], collapse=' '))
  return(wslice)
}

#slice_sequence = function(sequence, order=1) {
#  wslice = numeric(0)
#  for (i in 1:(length(sequence)-order+1)) {
#    wslice[i] = paste(sequence[i:(i+order-1)], collapse=' ')
#  }
#  return(wslice)
#}

count_table = function(sequence, order=1) {
  wnames = sort(union(sequence, c()))
  
  # making slice of sequence
  wslice = slice_sequence(sequence, order)
  #wslice = numeric(0)
  #for (i in 1:(length(sequence)-order+1)) {
  #  wslice[i] = paste(sequence[i:(i+order-1)], collapse=' ')
  #}
  
  #words = numeric(0)
  #count = numeric(0)
  #for (w in wslice) {
  #  i = match(w, words)
  #  if (is.na(i)) { # new entry
  #    i = length(count)+1
  #    words[i] = w
  #    count[i] = 0
  #  }
  #  count[i] = count[i] + 1
  #}
  words = setdiff(wslice, c())
  count = sapply(words, function(x) sum(!is.na(match(wslice, x))))
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
wtable[1:10,] # 10 most frequent words
