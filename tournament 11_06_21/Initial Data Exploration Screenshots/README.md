# Inspecting structure of dataframe
```{r} 
str(bjjdata)
# The following need to be factors since they are categories
# match_id
# category
# move_name
# submission
# W or L
# move_id
```
![Picture1](https://user-images.githubusercontent.com/74512335/147853092-fa2b339e-b418-4980-99e8-2bc10c58f029.jpg)

# High level view of dataframe
```{r} 
summary(bjjdata)
# Noticed there are too many NA's in columns which will throw off results
```
![Screenshot 2022-01-01 094705](https://user-images.githubusercontent.com/74512335/147853194-ee25a731-41d8-4326-a11e-18b5d063cfe9.jpg)
