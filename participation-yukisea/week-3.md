# Week 3

## Exercises
In this section, you should provide a **bulleted list** of **links** to exercise chapters you worked on this week. At a minimum, we expect to see substantial progress on the exercises discussed in class (remember, you should be pushing commits to the work you are doing in the `book-exercises-USER-NAME/` repository). For each link (chapter), include a brief note about which skills are covered in the exercise (this will be helpful to come back to!). Feel free to link to the entire chapter, or a specific exercise. For example:

- [Chapter 10, exercise 1](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-10-exercises/exercise-1/exercise.R): Learned to create data frame
- [Chapter 10, exercise 2](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-10-exercises/exercise-2/exercise.R): Practicing with data frame.
- [Chapter 10, exercise 3](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-10-exercises/exercise-3/exercise.R): Working with built-in data sets (US personal Expenditure).
- [Chapter 10, exercise 4](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-10-exercises/exercise-4/exercise.R): Working with external data sets (Gates Foundation Educational Grants)
- [Chapter 10, exercise 5](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-10-exercises/exercise-5/exercise.R): Working with large data sets(Baby Name Popularity Over Time)

## New Skills and Challenges
In this section, describe the new skills you acquired and challenges you encountered. The format is up to you -- feel free to use a list, a table, sub-headers, or any other format you see fit. Identifying concepts that you find difficult can help you round out your skills in a systematic way.

>New skills we learned this week is the basic commands of data frame and `extract specific data` we want. We also use `external data` such as csv file.

## Specific Code Sections
In this section, add _at least_ 3 code blocks containing code that you found helpful this week. This is your opportunity to keep track of syntax/code skeletons so you can easily come back to them for future use! Make sure to use **code block formatting** and **include comments** with the code. Feel free to also include images, links, or other content that makes this more useful for you!

```r
# view your data frame
View()
# pick random n numbers between A and B
num <- runif(n, A, B)
# create data frame "data_frame" by combining the 3 vectors
data_frame <- data.frame(c1, c2, c3, stringAsFactors = FALSE)
```

```r
#write a .csv file of your "data" data
write.csv(data, "data.csv")
# What was the highest expenditure category in 1960?
high_exp_1960 <- us_exp$category[us_exp$X1960 == max(us_exp$X1960)]
```

```r
# read data.csv file from "data" directory
data <- read.csv("data/data.csv", stringAsFactors = FALSE)
# convert to vactor from column
is.vector(column)
```

**ALWAYS DO THIS**

In order to `change my working directory`, we have to do this
![changing working directory](https://github.com/info201b-w19/participation-yukisea/blob/gh-pages/img/2019-01-25.jpg?raw=true)

## Goals for the upcoming week
What are your goals for the upcoming week? Are there any questions that you have that you hope to answer in the coming week?They can be specific and technical (e.g., _practice XX_) or general and more personal (e.g., _work more efficiently on homeworks_). Again, the format here is up to you -- this is also a great place to express your goals and areas of confusion to the TAs so they can provide better support!

> I want to handle data frame more fluently and quickly. And I need to understand various way to extract specific data.
