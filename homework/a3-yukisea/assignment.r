# a3-using-data

# Before you get started, set your working directory using the Session menu

###################### DataFrame Manipulation (20 POINTS) ######################

# Create a vector `first_names` with 5 names in it
first_name <- c("Yuki", "Natsumi", "Kuria", "Kyosuke", "Ryosuke")

# Create a vector `math_grades` with 5 hypothetical grades (0 - 100)
# in a math course (that correspond to the 5 names above)
math_grades <- c(58, 63, 83, 38, 28)

# Create a vector `spanish_grades` with 5 hypothetical grades (0 - 100)
# in a Spanish course (that correspond to the 5 names above
spanish_grades <- c(65, 86, 73, 99, 80)

# Create a data.frame variable `students` by combining
# the vectors `first_names`, `math_grades`, and `spanish_grades`
students <- data.frame("first_name" = first_name, "math_grades" = math_grades, "spanish_grades" = spanish_grades)

# Create a variable `num_students` that contains the
# number of rows in your dataframe `students`
num_students <- nrow(students)

# Create a variable `num_courses` that contains the number of columns
# in your dataframe `students` minus one (b/c of their names)
num_courses <- ncol(students) - 1

# Add a new column `grade_diff` to your dataframe, which is equal to
# `students$math_grades` minus `students$spanish_grades`
students$grade_diff <- students$math_grades - students$spanish_grades

# Add another column `better_at_math` as a boolean (TRUE/FALSE) variable that
# indicates that a student got a better grade in math
students$better_at_math <- students$math_grades > students$spanish_grades
# Create a variable `num_better_at_math` that is the number
# (i.e., one numeric value) of students better at math
num_better_at_math <- nrow(students[students$better_at_math == TRUE, ])

# Write your `students` dataframe to a new .csv file inside your data/ directory
# with the filename `grades.csv`. Make sure *not* to write row names.
write.csv(students, "data/grades.csv")


########################### Loading R Data (30 points) #########################

# In this section, you'll work with the `Titanic` data set
# Which is built into the R environment. You should be able to `View()` it
# Pay *close attention* to what each column means. Use ?Titanic to read more.
View(Titanic)

# This data set actually loads in a format called a *table*
# See https://cran.r-project.org/web/packages/data.table/data.table.pdf
# Use the `is.data.frame()` function to test if it is a table.
is.data.frame(Titanic)

# You should convert the `Titanic` variable into a data frame;
# you can use the `data.frame()` function or `as.data.frame()`
# Be sure to **not** treat strings as factors!
Titanic <- data.frame(Titanic, stringsAsFactors = FALSE)

# Create a variable `children` that contains *only* the rows of the data frame 
# with information about the children on the Titanic.
children <- Titanic[Titanic$Age == "Child", ]

# Create a variable `num_children` that is the total number of children.
# Hint: remember the `sum()` function!
num_children <- sum(children$Freq)

# Create a variable `most_lost` which has the *row* with the
# largest absolute number of losses (people who did not survive).
# Tip: if you want, you can use multiple statements (lines of code)
# if you find that helpful to create this variable.
died <- Titanic[Titanic$Survived == "No", ]
most_lost <- died[died$Freq == max(died$Freq), ]

# Define a function called `survival_rate()` that takes in a ticket class
# (e.g., "1st", "2nd") as an argument.This function should return the following
# sentence that compares the *total survival rate* of adult men vs.
# "women and children" in that ticketing class. It should read (for example):
# "Of Crew class, 87% of women and children survived and 22% of men survived.".
# The approach you take to generating the sentence to return is up to you.
# A good solution will likely utilize filtering to produce the required data.
survival_rate <- function(class){
  titanic_class <- Titanic[Titanic$Class == class,]
  men <- titanic_class[titanic_class$Sex == "Male" & titanic_class$Age == "Adult",]
  women_children <- titanic_class[titanic_class$Sex == "Female" | titanic_class$Age == "Child",]
  survived_men <- sum(men[men$Survived == "Yes",]$Freq) 
  survived_women_children <- sum(women_children[women_children$Survived == "Yes",]$Freq)
  men_survival_rate <- survived_men / sum(men$Freq) * 100 
  wo_chi_survival_rate <- survived_women_children / sum(women_children$Freq) * 100
  paste0("Of ", class, " class, ", round(wo_chi_survival_rate), "% of women and children survived and ",
         round(men_survival_rate), "% of men survived.")
  
}

# Create variables `first_survived`, `second_survived`, `third_survived` and
# `crew_survived` by passing each class to your function above.
first_survived <- survival_rate("1st")
second_survived <- survival_rate("2nd")
third_survived <- survival_rate("3rd")
crew_survived <- survival_rate("Crew")

########################### Reading in Data (40 points)#########################
# In this section, we'll read in a .csv file with a tabular row/column layout
# This is like Microsoft Excel or Google Docs, but without the formatting.
# The .csv file we'll be working with has the life expectancy
# for each country in 1960 and 2013. We'll ask real-world questions about the
# data by writing the code that answers our question.


# Using the `read.csv` function, read the life_expectancy.csv file into
# a variable called `life_expectancy`. Makes sure not to read strings as factors

life_expectancy <- read.csv("data/life_expectancy.csv", stringsAsFactors = FALSE)
# Determine if `life_expectancy` is a data.frame by using
# the is.data.frame function. You may also want to View() it.
is.data.frame(life_expectancy)
View(life_expectancy)

# Create a column `life_expectancy$change` that is the change
# in life expectancy from 1960 to 2013
life_expectancy$change <- life_expectancy$le_2013 - life_expectancy$le_1960

# Create a variable `most_improved` that is the *name* of the country
# with the largest gain in life expectancy
most_improved <- life_expectancy[life_expectancy$change == max(life_expectancy$change), "country"]

# Create a variable `num_small_gain` that has the *number* of countries
# whose life expectance has improved fewer than 5 years between 1960 and 2013
num_small_gain <- nrow(life_expectancy[life_expectancy$change < 5, ])

# Write a function `country_change()` that takes in a country's name
# as a parameter, and returns it's change in life expectancy from 1960 to 2013
country_change <- function(name){
  life_expectancy[life_expectancy$country == name, "change"]
}

# Using your `country_change()` function, create a variable `sweden_change`
# that is the change in life expectancy from 1960 to 2013 in Sweden
sweden_change <- country_change("Sweden")

# Define a function `lowest_life_exp_in_region()` that takes in a **region**
# as an argument, and returns the **name of the country**
# with the lowest life expectancy in 2013 (in that region)
lowest_life_exp_in_region <- function(region){
  life_expectancy_region <- life_expectancy[life_expectancy$region == region, ]
  life_expectancy_region[life_expectancy_region$le_2013 == min(life_expectancy_region$le_2013), "country"]
}

# Using the function you just wrote, create a variable `lowest_in_south_asia`
# that is the country with the lowest life expectancy in 2013 in South Asia
lowest_in_south_asia <- lowest_life_exp_in_region("South Asia")

# Write a function `bigger_change()` that takes in two country names
# as parameters, and returns a sentence that describes which country experienced
# a larger gain in life expectancy (and by how many years).
# For example, if you passed the values "China", and "Bolivia" to you function,
# It would return this:
# "The country with the bigger change in life expectancy was China (gain=31.9),
#  whose life expectancy grew by 7.4 years more than Bolivia's (gain=24.5)."
# Make sure to round your numbers to one digit.
bigger_change <- function(name1, name2){
  change_both_countries <- life_expectancy[life_expectancy$country == name1 | 
                                             life_expectancy$country == name2,]
  larger_contry <- change_both_countries[change_both_countries$change == 
                                           max(change_both_countries$change),] 
  smaller_country <- change_both_countries[change_both_countries$change == 
                                             min(change_both_countries$change),] 
  dif <- round(larger_contry$change, 1) - round(smaller_country$change, 1)
  paste0("The country with the bigger change in life expectancy was ", larger_contry$country,
         " (gain=", round(larger_contry$change, 1),"), whose life expectancy grew by ", dif,
         " years more than ", smaller_country$country, "'s (gain=", round(smaller_country$change, 1), ").")
}

# Using your `bigger_change()` function, create a variable `usa_or_france`
# that describes who had a larger gain in life expectancy (the U.S. or France)
usa_or_france <- bigger_change("United States", "France")

# Write your `life_expectancy` data.frame to a new .csv file to your
# data/ directory with the filename `life_expectancy_with_change.csv`.
# Make sure not to write row names.
write.csv(life_expectancy, "data/life_expectancy_with_change.csv")

############################## Challenge (10 points) ###########################
# Create a variable `highest_avg_change` that has the name of the region with
# the highest *average change* in life expectancy between the two time points.
# To do this, you'll need to *compute the average* change across the countries
# in each region, and then compare the averages across regions.
# Feel free to use any library of your choice, or base R functions.
change_region <- aggregate(change~region, data = life_expectancy, FUN = mean)
high_avg_change <- change_region[change_region$change == max(change_region$change), "region"]

# Create a *well labeled* plot (readable title, x-axis, y-axis) showing
# Life expectancy in 1960 v.s. Change in life expectancy
# Programmatically save (i.e., with code, not using the Export button)
# your graph as a .png file in your repo
# Then, in a comment below, *provide an interpretation* of the relationship
# you observe. Feel free to use any library of your choice, or base R functions.
png("le_1960_and_change.png")
le_1960_and_change <- plot(life_expectancy$le_1960, life_expectancy$change,
                           main = "Relationship between life expectancy 
                           in 1960 and changing after that(~2013)"
                           , xlab = "life expectancy in 1960",
                           ylab = "changing life expectancy(1960~2013)")
dev.off()
# Put your interpretation here!
# Country whose life expectancy in 1960 is low changes a lot, so the gap between rich countries and poor countries 
# becoming small. Therefore, as whole, life expectancy improve except one country.
