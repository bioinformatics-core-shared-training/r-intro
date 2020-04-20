# Week 2 live coding session

# up till now we've been mainly using R interactively at the command prompt in
# the Console window

# most code written in R script files - lets you save your code and return to it
# in a later session, share it with colleagues, etc.

# create new R script using File menu

# type some code into it and show how it warns you it has changes that haven't
# been saved

random_numbers <- rnorm(50, mean = 0, sd = 1)
random_numbers

# show how to save the file including using the keyboard shortcut

# show how to run the command using the Run button and the keyboard shortcut
# show how running a command moves the curson on to the next command

# show how to add a comment

# Vectors

# so far we've come across the simplest data structure in R - the atomic vector
# recap what an atomic vector is - ordered set of values of same type

# 2 ways of creating a vector - : and c()

1:10
10:1
# assignment to variable
countdown <- 10:1

# : operator creates a sequence of integers
# can be increasing of decreasing, can include negative numbers
-5:5

# in practice this is most often used to get a sequence of numbers from 1 to n
n <- 20
1:n

length(countdown)

days <- c(1, 2, 4, 8, 12, 16)

# c() is a function - the parentheses () are the clue

# look at help for c()
?c

# c(...) method signature shows it can take an arbitrary number of arguments
# look at description and draw attention to the various parts
# - description
# - signature
# - arguments
# - (return) value
# - see also
# - examples

# copy and paste examples
c(1,7:9)
c(1:5, 10.5, "next")

cats <- c("oscar", "tilly")
dogs <- c("snoopy", "spot")
cats_and_dogs <- c(cats, dogs)
cats_and_dogs

# can have the same value repeated
dogs <- c("snoopy", "spot", "oscar")
cats_and_dogs <- c(cats, dogs)
cats_and_dogs

# recap on coercion rules

c(TRUE, 3L)
typeof(c(TRUE, 3L))

c(FALSE, 3)
typeof(c(FALSE, 3))

c(1, "3")
typeof(c(1, "3"))

# explain why these make sense by considering each combination of logical,
# integer, double and character

# accessing elements of a vector

cats_and_dogs[4]

cats_and_dogs[c(1, 2, 4)]

# modifying elements

cats_and_dogs[5] <- "rex"
cats_and_dogs

cats_and_dogs[c(2, 5)] <- c("kitty", "milo")
cats_and_dogs

# () - function
# [] - subsetting

# parentheses are also used for ensuring the mathematical calculations are done
# in the order you intended, i.e. when normal precedence rules wouldn't work
9 + 6 / 3
(9 + 6) / 3

# excluding values
cats_and_dogs[-3]
cats_and_dogs[-c(3, 4)]

# subsetting with logical vectors
cats_and_dogs[c(TRUE, TRUE, FALSE, TRUE, FALSE)]
# same as cats_and_dogs[c(1, 2, 4)]
# why is this useful?

# conditional subsetting

# log2 fold changes - explain what these are, log2(after/before), and what
# values of -1, 0 and 1 mean
log2fc <- c(2.3, -1, 0.48, 0.97, -0.02, 1.23)

# extract just the log2 fold changes greater than 0.5
log2fc > 0.5
log2fc[log2fc > 0.5]

log2fc_threshold <- 0.5
log2fc[log2fc > log2fc_threshold]

# other logical operators: >, >=, <, <=, ==, !=
# can have multiple conditions using & (Boolean AND) or | (Boolean OR)

# large changes
log2fc[log2fc >= 1 | log2fc <= -1]

# small changes
log2fc[log2fc < 0.5 & log2fc > -0.5]

# can be used in modifying subsets of elements
log2fc
# e.g. to cap the maximum log2 fold change
log2fc > 1
log2fc[log2fc > 1] <- 1
log2fc

# vector arithmetic
# most operations are vectorized, the work on all elements of a vector in one go
some_numbers <- 1:10
some_numbers ^ 2

# element-by-element calculations
a <- 1:6
b <- c(3.2, 0.4, 1.6, 0.5, 1.3, 0.1)
a
b
a * b

# what if the number of elements in each vector are different?
a <- 1:6
b <- c(3.2, 0.4, 1.6)
a
b
a * b
# there are only 3 elements in b so when we get to the 4th element of a it
# starts again at the beginning of b - this is called vector recycling
a <- 1:6
b <- c(3.2, 0.4, 1.6, 0.5)
a * b
# warning message if the length of the longer vector is not a multiple of the
# length of the shorter vector

# most common operations involve 2 vectors with the same size or vectors of
# different sizes but where one vector has only 1 value, i.e. is a scalar
1:10 * 2

# beyond vectors

# lists

# lists allow us to combine different types of data
my_list <- list(1:10, c("a", "b", "c"), c(TRUE, FALSE), 150L, c(0.2, 1.6, 0.34, 1.47))
my_list

# this list contains 5 elements
# each of these elements contains a vector
# the vectors can be of different types and lengths

# notice how when printed the elements are referenced using [[ ]]
# this is the way of referring to elements of a list
my_list[[2]]

# elements of a list are usually named

genomics <- list(
  sequencers = c("Novaseq 6000", "HiSeq 4000", "NextSeq 500", "MiSeq"),
  robots = c("Mosquito", "Bravo")
)
genomics

genomics$sequencers
genomics[[2]]

genomics$sequencers[3]

# modifying list elements
genomics$sequencers[3] <- "NextSeq 550"
genomics

# adding list elements
genomics$dna_analyzers <- c("Bioanalyzer 2100", "Tapestation 4200")
genomics

length(genomics)
names(genomics)

# probably won't create lists like this in your analyses but they are the data
# structure that is the basis for the data frame that we're about to come onto
# and will use all through the rest of the course

# lists get returned by several of the statistical test functions
a <- rnorm(10, mean = 0.9, sd = 0.1)
b <- rnorm(10, mean = 1.1, sd = 0.1)
summary(a)
summary(b)
t.test(a, b)
result <- t.test(a, b)
is.list(result)
names(result)
result[[3]]
result$p.value
result$method
result$conf.int

# data frames

# data frames are a special type of list in which each vector element
# has the same length
beatles <- data.frame(
  names = c("John", "Paul", "Ringo", "George"),
  birth_year = c(1940L, 1942L, 1940L, 1943L),
  instrument = c("guitar", "bass", "drums", "guitar")
)
beatles

# data frames are how tabular data is represented in R

# example data frames provided by R

iris
?iris

head(iris)

# example data sets used in example code in help pages
# e.g. look at last example in help for unique function
?unique

class(iris)
typeof(iris)

names(iris)

iris$Petal.Length

iris$Petal.Length[1:10]

# can select a subset of columns (list operation)
iris[c("Petal.Width", "Petal.Length", "Species")]

colnames(iris)
rownames(iris)

mtcars
rownames(mtcars)

# select rows by id
mtcars["Ferrari Dino", ]
mtcars[c("Ferrari Dino", "Fiat 128"), ]

# the comma is important - otherwise R thinks you're trying to select columns
mtcars[c("Ferrari Dino", "Fiat 128")]

# can select individual element
head(mtcars)
mtcars[4, 3]

# can also use conditional subsetting, similar to what we did with vectors
# e.g. cars with automatic transmission
mtcars$am
mtcars$am == 0
mtcars[mtcars$am == 0, ]

# other useful functions for data frames
dim(mtcars)
nrow(mtcars)
ncol(mtcars)

# modifying data frames
mtcars["Ferrari Dino", ]
mtcars["Ferrari Dino", "cyl"] <- 8
mtcars["Ferrari Dino", ]

# use head to only show the top few lines
head(iris)

# open a data frame in the viewer
View(iris)

# search for 'versi'

# double click on our modified mtcars in the Environment pane

# tibbles

# a better version of the data frame provided by the tidyverse

library(tidyverse)

# explain about the tidyverse being a collection of packages that form a
# coherent system for exploring, manipulating and visualizing your data

# briefly highlight some of these packages (ggplot2, tidyr, dplyr) that we'll
# be covering in future weeks and readr that we'll be using to read in the a
# clinical cancer data set shortly

# briefly comment on the conflicts

# cut and paste beatles code from before and change data.frame to tibble

beatles <- tibble(
  names = c("John", "Paul", "Ringo", "George"),
  birth_year = c(1940L, 1942L, 1940L, 1943L),
  instrument = c("guitar", "bass", "drums", "guitar")
)
beatles

# draw attention to the differences in how this is printed
# dimensions and column types

iris_tibble <- as_tibble(iris)
iris_tibble

# only first 10 rows

class(iris)
class(iris_tibble)

# another data frame that comes with the dplyr package - going to use this
# in one of the assignment exercises
starwars

# note how the names are truncated to try to fit as many columns on the screen
# as possible, additional columns are listed at the end

# other differences are discussed in the online materials

# reading data into R

metabric <- read_tsv("data/brca_metabric_clinical_data.tsv")
metabric

# draw attention to spaces in the column names and how these have backticks
# RStudio auto-complete feature includes automatically adding backticks
metabric$`3-Gene classifier subtype`[1:10]

# also read_csv for CSV files
?read_tsv

# data exploration

colnames(metabric)

table(metabric$Chemotherapy)

summary(metabric$`Mutation Count`)

plot(metabric$`Age at Diagnosis`, metabric$`Nottingham prognostic index`)

# mention file paths and the working directory but again point to course
# materials for more details

# missing values

# draw attention to the red 'NA's in the metabric data set
metabric

# why do we need to worry about these?
mean(metabric$`Mutation Count`)

?mean

mean(metabric$`Mutation Count`, na.rm = TRUE)
