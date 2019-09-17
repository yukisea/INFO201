# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string
is_twice_as_long <- function(str1,str2){
  abs(nchar(str1)-nchar(str2)) >= min(nchar(str1),nchar(str2))
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!
is_twice_as_long("apple","banana")
is_twice_as_long("dog","banana")
is_twice_as_long("banana","dog")


# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"
desctribe_difference <- function(str1,str2){
  diff <-  nchar(str1) - nchar(str2)
  if(diff > 0){
    sentence <- paste("Your first string is longer by", diff, "characters")
  }
  else if(diff < 0){
    sentence <- paste("Your second string is longer by", -diff, "characters")
  }
  else{
    sentence <- "Your strings are the same length!"
  }
  sentence
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1
desctribe_difference("apple","banana")
desctribe_difference("dog","banana")
desctribe_difference("banana","dog")

