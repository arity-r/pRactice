
filename = 'Genetic algorithm.txt'
order = 1

words = scan(filename, character(0), quiet=T, quote='', encoding='UTF-8')
words = words[!is.na(words)] # omit NA
words = gsub('[[:punct:]]', '', words) # omit metacharacters
words = words[nchar(words)>0] # omit length < 1
words = tolower(words) # convert to lower case
wtable = sort(table(words), decreasing=T)

count_table = function(sequence, order=1) {
  wnames = sort(union(sequence, c()))
  nameslist = list()
  for (i in 1:order) {
    nameslist = append(nameslist, list(wnames))
  }
  dim = length(wnames)^order
  result = do.call(expand.grid, nameslist)
  result$Words = apply(result, 1, function(x) paste(x, collapse=' '))
  result$Count = rep(0, dim)
  
  # making slice of sequence
  wslice = numeric(0)
  for (i in 1:(length(sequence)-order+1)) {
    wslice[i] = paste(sequence[i:(i+order-1)], collapse=' ')
  }
  
  for (w in wslice) {
    i = match(w, result$Words)
    result$Count[i] = result$Count[i] + 1
  }
  
  result$Probability = result$Count / length(wslice)
  
  return(result)
}

count_table(words, order=order)
