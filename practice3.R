
# practice 3.1 (if statement)
# scan a number and find if the number is divisible by three
# if so, print 'divisible by three'
# if not, print 'not divisible by three'
n = scan()
if (n %% 3 == 0) print('divisible by three')
else print('not divisible by three')

# practice 3.2 (if statement)
# scan a number and find if the number is divisible by three and five
# (1) if divisible by only three, print 'divisible by three'
# (2) if divisible by only five, print 'divisible by five'
# (3) if divisible by three and five, print 'divisible by three and five'
# (4) if divisible by neither three nor five,
#   print 'not divisible by three and five'
n = scan()
if (n %% 3 == 0 & n %% 5 != 0) print('divisible by three')
if (n %% 3 != 0 & n %% 5 == 0) print('divisible by five')
if (n %% 3 == 0 & n %% 5 == 0) print('divisible by three and five')
if (n %% 3 != 0 & n %% 5 != 0) print('not divisible by three and five')

# practice 3.3 (two repetitions: for)
# With for statement and vector c('fuji', 'orin'),
# print 'delicious fuji' and 'delicious orin'.
# hint: for string concatenation, use paste('foo', 'bar').
for (w in c('fuji', 'orin')) {
  print(paste('delicious', w))
}

# practice 3.4 (two repetitions: while)
# with while statement,
# ask a number till it is divisible by 3
n = -1
while (n %% 3 != 0) {
  n = scan()
}

# practice 3.5 (fizzbuzz)
# for numbers less than or equal to 100,
# print fizz if it is divisible by 3
# print buzz if it is divisible by 5
# print fizzbuzz if it is divisible by both 3 and 5
# print the number if is not divisible by both 3 and 5
# i.e. 1 2 fizz 4 buzz fizz 7 8 fizz buzz...
for (n in 1:100) {
  if (n %% 3 == 0 & n %% 5 != 0) print('fizz')
  if (n %% 3 != 0 & n %% 5 == 0) print('buzz')
  if (n %% 3 == 0 & n %% 5 == 0) print('fizzbuzz')
  if (n %% 3 != 0 & n %% 5 != 0) print(n)
}

# practice 3.6 (function)
# Make a function which you pass a word and
# returns 'delicious <your word>'.
# And try it with some words.
f = function(x) paste('delicious', x)
f('fuji')
f('orin')

# practice 3.7 (vector and function)
# for vector, c('fuji', 'orin', ...),
# create a vector c('delicious fuji', 'delicious orin', 'delicious ...')
# with function f = paste('delicious', x), and
# sapply function(see help(sapply))
as.vector(sapply(c('fuji', 'orin'), function(x) paste('delicious', x)))
