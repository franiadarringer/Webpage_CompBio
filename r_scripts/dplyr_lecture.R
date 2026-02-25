# dplyr
# frania darringer 2/25

# used for data manipulation and structure for dataframes
# filter(), arrange(), select(), summarize(), group_by(), mutate()

library(tidyverse)

# to specify what package to use, call on package name
# dyplyr::filter()

data(starwars)
class(starwars)

# tbl is like a data frame

# cleaning the dataset
# base r has the complete.cases function - this removes rows with NAs
# indexing has the form of [rows, columns]
starwars_clean <- starwars[complete.cases(starwars[,1:10]),]

# you can check for NAs using is.na function
is.na(starwars_clean[,1])

# filter()
# picks subset observations by their values
# uses >, <, etc.
# logical operators like & and |
# filter automatically excludes NAs, have to ask for them specifically
filter(starwars_clean, gender == "masculine" & height < 180)
filter(starwars_clean, gender == "masculine", height < 180, height > 100)

# %in% filters for multiple different conditions
filter(starwars, eye_color %in% c("blue", "brown"))

# arrrange() reorders rows
arrange(starwars_clean, by=height)
arrange(starwars_clean, by=desc(height))
arrange(starwars_clean, height, desc(mass))
# additional columns will break ties in preceding columns

# select() chooses variables based on their names/columns
starwars_clean[1:10,]
select(starwars_clean, 1:10) # these two funcs are the same

# rearrange columns
select(starwars_clean, homeworld, name, gender, species) # now only 4 cols
select(starwars_clean, homeworld, name, gender, species, everything()) 

# tells us whatever column name matches string of color
select(starwars_clean, contains("color"))

# rename columns
rename(starwars_clean, haircolor=hair_color)

# mutate() creates new variables with functions of existing variables
# create a new column that's the height divided by mass
mutate(starwars_clean, ratio=height/mass)

starwars_lbs <- mutate(starwars_clean, mass_lbs = mass*2.2)
print(starwars_lbs)

# transmute() to just have the new variable you want
transmute(starwars_clean, mass_lbs=mass*2.2)

# summarize() and group_by() functions collapse cols into summary
summarize(starwars_clean, mean_height=mean(height))
summarize(starwars) # won't work with NA values

summarize(starwars, mean_height=mean(height, na.rm=TRUE), TotalNumber=n())
starwars_gender <- group_by(starwars, gender)
print(starwars_gender)
summarize(starwars_gender, mean_height=mean(height, na.rm=TRUE), number=n())

# pipe statements mean using a pipe operator
# %>% is a pipe, so is |>
# means "and then", chains actions
# it's going to pass intermediate results onto next function in the sequence
# you should avoid this when you need to manipulate more than one object
# always have a space before it, followed by automatic indent
starwars_clean %>%
group_by(gender) %>%
  summarize(mean_height=mean(height, na.rm=TRUE), number=n())

# case.when() function is useful for multiple conditional ifelse statements
starwars_clean %>%
  mutate(sp=case_when(species=="Human"~"Human", TRUE ~ "Non-human")) %>%
  select(name, sp, everything())
unique(starwars_clean$species)

glimpse(starwars_clean)

# pivot from long to wide format using pivot_wider or pivot_longer
widesw <- starwars_clean %>%
  select(name, sex, height) %>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)

print(widesw)

pivotsw <- starwars %>%
  select(name, homeworld) %>%
  group_by(homeworld) %>%
  mutate(rn=row_number()) %>%
  ungroup() %>%
  pivot_wider(names_from=homeworld, values_from=name)

print(pivotsw)