# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - two different pairwise comparisons (i.e., between the three species)
#    HINT: use the t.test() function
my.iris <- iris
head(my.iris)
my.iris$Species

# this is just one way of doing it
setosa.sepalwidth <- my.iris$Sepal.Width[1:50]
versicolor.sepalwidth <- my.iris$Sepal.Width[51:100]
virginica.sepalwidth <- my.iris$Sepal.Width[101:150]

t.test(setosa.sepalwidth, versicolor.sepalwidth)
t.test(setosa.sepalwidth, virginica.sepalwidth)
t.test(versicolor.sepalwidth, virginica.sepalwidth)

# 2. Find the overall correlation between Sepal.Length and Petal.Length
#    HINT: use the cor() function
cor(my.iris$Sepal.Length, my.iris$Petal.Length)

# 3. Get the correlation between Sepal.Length and Petal.Length for each Species separately
setosas <- my.iris[1:50, ]
versicolors <- my.iris[51:100, ]
virginicas <- my.iris[101:150, ]

cor(setosas$Sepal.Length, setosas$Petal.Length)
cor(versicolors$Sepal.Length, versicolors$Petal.Length)
cor(virginicas$Sepal.Length, versicolors$Petal.Length)

# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.
#    HINT: first use head() and summary() to "peek" at the data
head(ToothGrowth)
summary(ToothGrowth)

t.test(len ~ supp, data = ToothGrowth)

# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch's. 
#    Re-run it an additional time as a paired t-test.
#    HINT: read the help file carefully!

t.test(len ~ supp, data = ToothGrowth, var.equal = TRUE)

# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    HINT: use help.search() or ?? to find a function to do this
??Wilcoxon
?wilcox.test

wilcox.test(setosa.sepalwidth, versicolor.sepalwidth)
wilcox.test(setosa.sepalwidth, virginica.sepalwidth)
wilcox.test(versicolor.sepalwidth, virginica.sepalwidth)

# 7. Save all results (and only those results!) in an .RData object
#    - try to think of (at least) two ways to do this

save()

# 8. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
#    HINT: start with the help for read.table()

