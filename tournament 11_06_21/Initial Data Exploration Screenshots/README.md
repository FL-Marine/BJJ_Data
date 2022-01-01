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

# Checking new dataframe structure
```{r} 
str(bjjdata_clean)
```
![image](https://user-images.githubusercontent.com/74512335/147853433-12691ea9-3a1c-4149-833c-120f9116e6dc.png)

# New high level summary check 
```{r}
summary(bjjdata_clean)
```
![image](https://user-images.githubusercontent.com/74512335/147853467-02e9be8d-3550-4a1e-8cda-6903dba96d6d.png)

