
# practice 1.1 (arithmetic operators)
# convert minuets to hours:minues
# e.g. 123 -> 2:03, 255 -> 4:15
# hint: use division and modulation
minutes = 123
hours = minutes %/% 60
minutes = minutes %% 60
print(paste(hours, ':', minutes))
# advanced
print(sprintf('%d:%02d', hours, minutes))

# practice 1.2 (integer operations & math function)
# with floor function and log10 function,
# find the number of digits of a number
# e.g. 12345 -> 5, 654321 -> 6
# hint: 1-(10-1) -> 1 digit 10-(100-1) -> 2 digits ...
#       log10(1) = 0, log10(10) = 1, log10(100) = 2 ...
number = 654321
digits = floor(log10(number)) + 1
digits

# practice 1.3 (vector operation)
# find how many numbers which are
#   (i)  divisible by three
#   (ii) smaller than or equal to 1000
# with
#   from:to (colon operator): generates a vector(from, from+1, ..., to-1, to)
#   length function: get the length of a vector
x = 1:1000
length(x[x%%3==0])

# practice 1.4 (vector operation)
# find how many numbers which are
#   (i)  divisible by three or five
#   (ii) smaller than or equal to 1000
# with
#   from:to (colon operator): generates a vector(from, from+1, ..., to-1, to)
#   length function: get the length of a vector
#   | (logical or operator): try this script: x[x<10 | x>990]
x = 1:1000
length(x[x%%3==0 | x%%5==0])

# practice 1.5 (matrix operation)
# solve:
#    x + 2y + 3z = 2
#   2x + 5y + 9z = 10
#   5x + 7y + 8z = 20
# and see the result
# from http://stackoverflow.com/questions/8145694/solving-simultaneous-equations-with-r
a = matrix(c(1,2,5,2,5,7,3,9,8), 3,3)
b = matrix(c(2, 10, 20))
solve(a, b)

# practice 1.6 (around data frames: verse 1)
# load dataframe from apple_juice.csv
# aj = read.csv('apple_juice.csv')
# (take a look at "Load an Excel(csv) file")
# and run several commands
#   (1) summary(aj), summary(aj$pH)
#   (2) mean(aj$pH)
#   (3) median(aj$pH)
#   (4) range(aj$pH)
#   (5) var(aj$pH)
#   (6) sd(aj$pH)
# data from:
# http://www.stat.ufl.edu/~winner/data/apple_juice.dat
# http://www.stat.ufl.edu/~winner/data/apple_juice.txt
aj = read.csv('apple_juice.csv')
summary(aj)
summary(aj$pH)
mean(aj$pH)
median(aj$pH)
# continues...
