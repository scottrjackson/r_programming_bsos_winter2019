# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - two different pairwise comparisons (i.e., between the three species)
#    HINT: use the t.test() function

sepalwidth.setosa <- my.iris[1:50, "Sepal.Width"]
sepalwidth.versicolor <- my.iris[51:100, "Sepal.Width"]
sepalwidth.virginica <- my.iris[101:150, "Sepal.Width"]

ttest1 <- t.test(sepalwidth.setosa, sepalwidth.versicolor)
ttest2 <- t.test(sepalwidth.versicolor, sepalwidth.virginica)
ttest3 <- t.test(sepalwidth.setosa, sepalwidth.virginica)

# 2. Find the overall correlation between Sepal.Length and Petal.Length
#    HINT: use the cor() function

sepalpetal.cor <- cor(my.iris$Sepal.Length, my.iris$Petal.Length)
cor.test(my.iris$Sepal.Length, my.iris$Petal.Length)

# 3. Get the correlation between Sepal.Length and Petal.Length for each Species separately
setosa.rows <- 1:50
versicolor.rows <- 51:100
virginica.rows <- 101:150

sepalpetal.cor.setosa <- cor(my.iris$Sepal.Length[setosa.rows], my.iris$Petal.Length[setosa.rows])
sepalpetal.cor.versicolor <- cor(my.iris$Sepal.Length[versicolor.rows], my.iris$Petal.Length[versicolor.rows])
sepalpetal.cor.virginica <- cor(my.iris$Sepal.Length[virginica.rows], my.iris$Petal.Length[virginica.rows])

# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.
#    HINT: first use head() and summary() to "peek" at the data

myToothGrowth <- ToothGrowth
head(myToothGrowth)
summary(myToothGrowth)
View(myToothGrowth)

tooth.ttest <- t.test(ToothGrowth$len[1:30], ToothGrowth$len[31:60])

# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch's. 
#    Re-run it an additional time as a paired t-test.
#    HINT: read the help file carefully!
tooth.ttest.students <- t.test(ToothGrowth$len[1:30], ToothGrowth$len[31:60], var.equal = TRUE)

# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    HINT: use help.search() or ?? to find a function to do this
??Wilcoxon

wilcox1 <- wilcox.test(sepalwidth.setosa, sepalwidth.versicolor)
wilcox2 <- wilcox.test(sepalwidth.versicolor, sepalwidth.virginica)
wilcox3 <- wilcox.test(sepalwidth.setosa, sepalwidth.virginica)

# 7. Save all results (and only those results!) in an .RData object
#    - try to think of (at least) two ways to do this

save(ttest1, ttest2, ttest3, 
     sepalpetal.cor, sepalpetal.cor.setosa, sepalpetal.cor.versicolor, sepalpetal.cor.virginica,
     tooth.ttest,
     wilcox1, wilcox2, wilcox3,
     file = "practice_day1_results.RData")

# 8. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
#    HINT: start with the help for read.table()

