
# practice 2.1 (basic graph)
# draw these graphs:
#   y = x        (-10 < x < 10)
#   y = cos(x)   (-pi < x < pi)
#   y = tan(x)   (-pi < x < pi)
#   y = asin(x)  (-1  < x < 1)
#   y = atan(x)  (-10 < x < 10)
#   y = log(x)   ( 0  < x < 10)
#   y = exp(x)   (-1  < x < 1)
#   y = floor(x) ( 0  < x < 10)
#   y = trunc(x / 60)  (x < 180)
#   y = trunc(x %% 60) (x < 180)
#   y = floor(log10(x)) + 1
x = seq(-10, 10, len=1000)
plot(x, x, type='l') # y = x
x = seq(-pi, pi, len=1000)
plot(x, cos(x), type='l') # y = cos(x)
# skip some plots
x = seq(0, 10, len=1000)
plot(x, floor(x), type='l') # y = floor(x)
x = seq(0, 180, len=1000)
plot(x, trunc(x / 60), type='l') # y = trunc(x / 60)
plot(x, trunc(x %% 60), type='l') # y = trunc(x %% 60)
x = seq(1, 10000, len=10000)
plot(x, floor(log10(x))+1, type='l') # y = floor(log10(x))
plot(x, floor(log10(x))+1, type='l', log='x') # log version

# practice 2.2 (handling multiple graphs)
# To draw multiple graphs, run
#   (1) same axis
#     plot(x, y1, type='l')
#     lines(x, y2, type='l')
#   (2) multiple plots
#     par(mfrow=c(1,2))
#     plot(x, y1, type='l')
#     plot(x, y2, type='l')
# Try (1) and (2) for
#   x=seq(0,1,len=1000), y1=x^2, y2=exp(x)-1
x = seq(0, 1, len=1000)
y1= x^2
y2=exp(x)-1
# (1)
plot(x, y1, ylim=c(0, max(y1, y2)), type='l')
lines(x, y2, type='l')
# (2)
par(mfrow=c(1,2))
plot(x, y1, type='l')
plot(x, y2, type='l')
par(mfrow=c(1,1)) # just restoring previous plot number

# practice 2.3 (plot meets data frame)
# From apple_production.csv, make a chart
# of apple production by years.
ap = read.csv('apple_production.csv')
plot(ap$Year, ap$Production, type='l',
     main='Japanese apple production',
     xlab='Year', ylab='Production(ton)')

# practice 2.4 (around hisogram)
# from apple_juice.csv, make a historgram of pH
aj = read.csv('apple_juice.csv')
hist(aj$pH, main='pH of apple juice')

# practice 2.5 (around boxplot)
# form apple_juice.csv, make a boxplot that
# y axis is pH.
# two boxes(first: Growth=0, second: Growth=1)
aj = read.csv('apple_juice.csv')
boxplot(aj$pH[aj$Growth==0], aj$pH[aj$Growth==1],
        main='pH comparison',
        names=c('Growth=0', 'Growth=1'),
        ylab='pH')

# practice 2.6 (around bar chart)
# from apple_production.csv, make a bar chart
# of each species and Others (Production - four species) in 2014
ap = read.csv('apple_production.csv')
# use anlist for dropping names from data frame
barplot(unlist(c(ap[1,][3:6], ap[1,][2]-sum(ap[1,][3:6])), use.names=F),
        main='Japanese apple production 2014',
        names.arg=c(names(ap)[3:6], 'Others'),
        ylab='Production(ton)')

# practice 2.7 (around pie chart)
# from apple_production.csv, make a pie chart
# of each species and Others (Production - four species) in 2014
ap = read.csv('apple_production.csv')
ap_2014 = unlist(c(ap[1,][3:6], ap[1,][2]-sum(ap[1,][3:6])), use.names=F)
names(ap_2014) = c(names(ap)[3:6], 'Others')
ap_2014.col = c('orangered', 'red', 'green', 'orange', 'yellow')
pie(ap_2014, radius=1, col=ap_2014.col,
    main='Japanese apple production 2014')
# ... and, that's how I make an apple pie (chart).
