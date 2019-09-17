# Week 4

## Exercises
In this section, you should provide a **bulleted list** of **links** to exercise chapters you worked on this week. At a minimum, we expect to see substantial progress on the exercises discussed in class (remember, you should be pushing commits to the work you are doing in the `book-exercises-USER-NAME/` repository). For each link (chapter), include a brief note about which skills are covered in the exercise (this will be helpful to come back to!). Feel free to link to the entire chapter, or a specific exercise. For example:

- [Chapter 11, exercise 1 ](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-1/exercise.R): Working with data frames for review
- [Chapter 11, exercise 2](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-2/exercise.R): Learned syntax of dplyr
- [Chapter 11, exercise 3](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-3/exercise.R): Using pipe operator.
- [Chapter 11, exercise 4](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-4/exercise.R): Practicing with dplyr
- [Chapter 11, exercise 5](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-5/exercise.R): Practice for dplyr grouped operations
- [Chapter 11, exercise 6](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-6/exercise.R): dplyr join operations
- [Chapter 11, exercise 7](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-7/exercise.R): Using dplyr on external data(nba team)
- [Chapter 11, exercise 8](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-11-exercises/exercise-8/exercise.R): Exploring data sets
## New Skills and Challenges
In this section, describe the new skills you acquired and challenges you encountered. The format is up to you -- feel free to use a list, a table, sub-headers, or any other format you see fit. Identifying concepts that you find difficult can help you round out your skills in a systematic way.

>New skills we learned this week is the basic commands of `deplyr` such as `group_by`, `summarise`, and so on. We also learned pipe operation `%>%`.
## Specific Code Sections
In this section, add _at least_ 3 code blocks containing code that you found helpful this week. This is your opportunity to keep track of syntax/code skeletons so you can easily come back to them for future use! Make sure to use **code block formatting** and **include comments** with the code. Feel free to also include images, links, or other content that makes this more useful for you!

```r
#dplyr
# select column(s)
column <- select(data, column, ...)
# filter the data
data <- filter(data, condition)
# modify the data frame
data <- mutate(data, column = ...)
```

```r
# install package
install.packages("...")
# load the library to use
library("dplyr")
# pipe operator
best_model <- select(filter(filter(data, ...), ...), ...)
best_model <- filter(data, ...) %>% filter(...) %>% select()
```

```r
# sort the data
arange(data, column)
# make a histogram
hist(data)
# create another data
summarise()
# grouping by the data of one column
group_by(data, ...)

```


## Goals for the upcoming week
What are your goals for the upcoming week? Are there any questions that you have that you hope to answer in the coming week?They can be specific and technical (e.g., _practice XX_) or general and more personal (e.g., _work more efficiently on homeworks_). Again, the format here is up to you -- this is also a great place to express your goals and areas of confusion to the TAs so they can provide better support!

> I want to handle `dplyr` and `pipe operator` more fluently and quickly. And I need to understand various way to extract specific data.
