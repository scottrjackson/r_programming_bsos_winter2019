# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
scottdata <- read.csv("scottdata/CognitionPaperFinalData.csv")

# 2. Peek at the top few rows
head(scottdata)

# 3. Peek at the top few rows for only a few columns
head(scottdata[, 1:5])

# 4. How many rows does your data have?
nrow(scottdata)
length(scottdata) # this gives a different answer: stay tuned as to why!

# 5. Get a summary for every column
summary(scottdata)

# 6. Get a summary for one column
summary(scottdata$Corpus) # compare with what you get with:
summary(scottdata[, c("Corpus", "AllMinPairs")])

# 7. Are any of the columns giving you unexpected values?
summary(scottdata$AllMinPairs) # wow, that's a high maximum value!

# 8. Select a few key columns, make a vector of the column names
colnames(scottdata)
columns.to.examine <- c("Corpus", "Pair", "WithinMinPairs", "Merged")
head(scottdata[, columns.to.examine])

# 9. Create a new data.frame with just that subset of columns
scottdata.sub1 <- scottdata[, columns.to.examine]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

nrow(scottdata.sub1)
scottdata.sub1.topbottom <- scottdata.sub1[c(1:10, 625:634), ]
scottdata.sub1.topbottom
# a better way:
scottdata.sub1.topbottom <- scottdata.sub1[c(1:10, (nrow(scottdata.sub1) - 9):nrow(scottdata.sub1)), ]

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
scottdata.sub2 <- scottdata[sample(nrow(scottdata), replace = FALSE), ] # good to be explicit here!
rownames(scottdata)
rownames(scottdata.sub2)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test() (or cor.test()) for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

first.test <- t.test(WithinMinPairs ~ Merged, data = scottdata)
first.test
# "vector" format not (easily) possible because it's not easy (yet)
#    to pull out Merged vs. UnMerged

# 13. Repeat #12 for TWO more comparisons
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise


# 14. Save all results from #12 and #13 in an .RData file
save(first.test, file = "first t-test results.RData")
rm(first.test)
first.test
load("first t-test results.RData")
first.test

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


