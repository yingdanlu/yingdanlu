###### R practice code for beginners ###### 
###### Created by Yingdan Lu ###### 
###### A special thanks to Anna Gibson (Instructor) and Mufan Luo (my fellow TA) ###### 
################################################################################################

#### You can 'run' this R code in the R console (bottom left quadrant in R Studio). Do it step-by-step.
#### Lines with hashtags (like this) are just 'comments', i.e., it's just plain English for you to read. R knows that!
#### Make sure you have also downloaded the sample data (turnout.csv and afghan.csv) and put them in the same folder with this code
################################################################################################

## This script will walk you through the following:

## 1. Set Your Working Directory
## 2. Object 
## 3. Vector
## 4. Data file
## 5. Basic descriptive stats
## 6. Basic plots 


################################
##### Set Your Working Directory

## For our convenience, we can tell R where our 'working directory' locates. 
## So when it looks for data, it goes there. You can simply do that within one line of code:
setwd("YOUR WORKING DIRECTORY")   
## setwd literally stands for 'set working directory', e.g., '/Users/yingdanlu/Downloads/folderx'

## Now R is all set to start! It knows where to go to read and write data. 
## If you're ever unsure of your working directory, use this:
getwd()  # and leave the parentheses empty. R will 'get' the working directory and tell you where you 'are' 

################################
##### Object
a <- 1
class(a) # a is an object with the numeric value 1

a <- "1"
class(a) # a is an object with the character 1

a + 1

## Rules of naming an object
123abc <- 1 # Cannot begin with a number and cannot contain spaces
+-abc <- 1 # Avoid special characters
ABC <- "a"
Abc <- "b"
print(ABC == Abc) # Naming in R follows the "case sensitive" rule

## Exercise: 
# Create a character object “my_favorite_app” and assign the name of your favorite smartphone app to this object in the script.
# Check the class of this object

################################
##### Vector

## Create a vector
v1 <- c(0,1,2,3,4,5,6,7,8)
print(v1)
class(v1)

## Computations on a vector: element-wise
v2 <- v1 * 3
print(v2)

v3 <- v1+v2
print(v3)

## Indexing
print(v1[1]) # Print the first element of vector v1
v4 <- v1[-1] # Remove the first element of v1 and store a new vector as v4
print(v4)

## Exercise: 
# Create a vector that stores three character elements
# Remove the first element in my_friend, and print my_friend


################################
##### Data file

## Read in the data
# Make sure to name your storage objects carefully, so you can keep track of what they are
dt <- read.csv("YOUR DATA") #e.g., dt <- read.csv("turnout.csv")

## Observe the data (run dt <- read.csv("turnout.csv"))
# We can look at a whole spreadsheet in R, but that's messy and hard to read. See:
print(dt)
# Normally, the most informative option is usually head or summary
head(dt) # This shows the first few rows of the data. It is sometimes useful to see what the data 'looks' like on paper
summary(dt) # This gives summary statstistics of all the variables
# Instead, if we want to see what variables are included in the dataset, we can do this:
colnames(dt) # This literally means 'column names', which returns the names of the variables.
row.names(dt) # This returns the 'row names.' For this data we don't set specific row names so it returns row number.

## Indexing
print(dt[,1]) # First column
print(dt[1,]) # First row
print(dt[, "VEP"]) # Column with name "VEP"
print(mean(dt$VEP)) # Print average VEP

## Save csv file
new_dt <- dt[1:10, ] # Subset the first 10 rows
write.csv(new_dt, "turnout_new.csv") # Write file into a CSV file called turnout_new.csv

## Observe one column (variable) in a data set
dt$VEP # Index the "VEP" column
class(dt$VEP) # Check the class of this column -integer (numeric)


################################
##### Basic descriptive stats
## We now use a larger dataset to learn how to create basic stats and plots
afghan <- read.csv("afghan.csv")
View(afghan) # Take a look at the dataframe

## Check variable type using the command of class()
class(afghan$province)
class(afghan$district)
class(afghan$age)
class(afghan$employed)

## turn employed as a factor variable
afghan$employed <- as.factor(afghan$employed)
class(afghan$employed)

## Descriptive stats of age
mean(afghan$age) # Mean
mean(afghan$age, na.rm = T) # If there is any NAs in the column, use this line.
sd(afghan$age, na.rm = T) # Standard deviation
IQR(afghan$age) # The interquartile range


################################
##### Basic plots
## Create histogram to see the distribution of the age variable
hist(afghan$age) 

# Make your histogram more beautiful by adding more parameters
hist(afghan$age, 
     main = "Distribution of villagers by age", #plot title
     col = "grey", #color of the bars
     xlab = "Age",  #name of the x-axis
     ylab = "Count" #name of the y-axis
)

# Add verticle lines to show the mean (in blue) and median (in red) of the age of the villagers
abline(v = mean(afghan$age, na.rm = T), col = "blue") 
abline(v = median(afghan$age, na.rm = T), col = "red") 

## Box plot: Identify outliers or doing comparison
boxplot(afghan$age, main = "Distribution of Age", ylab = "Age", ylim = c(10,80))

