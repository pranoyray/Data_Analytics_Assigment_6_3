#Data Analytics Assignment 6_3 - Session 6:

# Import Data Set
yeast <- read.table("yeast.txt", quote="\"", comment.char="")
View(yeast)

names(yeast) <- c("seq","mcg", "gvh", "alm", "mit", "erl", "pox", "vac", "nuc", "class")
head(yeast)
dim(yeast)
sapply(yeast, function(x) sum(is.na(yeast)))

# Q1 (a): Perform ANOVA test on the discriminant analysis scores of nuclear 
# localization signals of both nuclear
# and non-nuclear proteins by class variables (Target).

#Solution:
# HO : scores across the class variables is same
x <- aov(nuc~class, data = yeast)
summary(x)

# since p value is less than 0.05, scores across the class variables is 
# not same at 95% confidence level

# Q1 (b). Which class is significantly different from others?

#Solution:
TukeyHSD(x)
# ERL is significantly different from others
