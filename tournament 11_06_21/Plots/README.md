## Category Counts
```{r}
ggplot(data = bjjdata, mapping = aes(x = category)) + geom_bar()
# This is plotting the category count amounts which is misleading
# This shows how many times each category appear in the data set
```
![image](https://user-images.githubusercontent.com/74512335/149384886-4c4dc3a6-f2f8-4669-9ad0-32893a9848fc.png)

## Offensive moves success
```{r}
ggplot(bjjdata, aes(x = offense_succeeded)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)

# This shows a count of how many times an offensive move succeeded
# 0 - 93x
# 1 - 7x
# 2 - 7x
# 3 - 5 - 1x 
```
![image](https://user-images.githubusercontent.com/74512335/149394318-558bd206-6fbe-4742-a23d-d1de026d248c.png)


## Offensive moves attempts
```{r}
ggplot(bjjdata, aes(x = offense_attempted)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times an offensive move was attempted
# 0 - 98x
# 1 - 7x
# 2 - 1x
# 3 - 3x
# 4 - 0x
# 5 - 1x 
```
![image](https://user-images.githubusercontent.com/74512335/149394824-38ae98b2-c17b-4e60-bc87-e49cb948d2b7.png)

## Defensive moves success
```{r}
ggplot(bjjdata, aes(x = defense_succeeded)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times a defensive move was successful
# 0 - 92x
# 1 - 9x
# 2 - 2x
# 3 - 3x
# 4 - 0x
# 5 - 1x 
```
![image](https://user-images.githubusercontent.com/74512335/149395243-e22410c0-99bb-463c-8685-3baed493a4fb.png)

## Defensive moves attempts
```{r}
ggplot(bjjdata, aes(x = defense_attempted)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times an defensive move was attempted
# 0 - 101x
# 1 - 8x
# 2 - 1x
```
![image](https://user-images.githubusercontent.com/74512335/149395566-bc316322-a923-47b5-b299-0e1fd5102e82.png)

## Top Successful Offensive Moves Treemap
```{r}
ggplot(
  bjjdata_move_name_vector1,
  aes(
    area = offense_succeeded,
    fill = move_name,
    label = paste0(move_name, "\n", offense_succeeded)
  )
) +
  geom_treemap() + geom_treemap_text() + theme(legend.position =  "none") + labs(title = "Top Successful Offensive Moves")
  
  # Top 3 successful offense moves
  # 1. Lateral throw
  # 2. Offensive guard
  # 3. Offensive half guard
  
```
![image](https://user-images.githubusercontent.com/74512335/149411019-18b18758-1300-44ab-b098-15ee963a33f3.png)

## Top Successful Defensive Moves
```{r}
ggplot(bjjdata_move_name_vector2,
       aes(x = fct_rev(fct_reorder(move_name, defense_succeeded)), y = defense_succeeded)) +
        geom_col() + geom_text(aes(label = defense_succeeded),
        vjust = 1,
        color = "white") + 
        labs(title = "Top Successful Defensive Moves") +  
        theme(axis.text.y = element_blank(),
              axis.ticks.y = element_blank()) + labs(x = "move_name")
# Top 3 successful defensive  moves
# 1. Trip
# 2. Sweep
# 3. Tie single and double leg
 ```
![image](https://user-images.githubusercontent.com/74512335/149563027-eaabf611-ab42-42cf-a545-16b8a79b4a0c.png)

# Points Prevented
```{r}
points_defended %>%
  filter(points_prevented >= 1L & points_prevented <= 14L) %>%
  ggplot() +
  aes(x = move_name, weight = points_prevented) +
  geom_bar(fill = "#051C45") + geom_text(
    aes(label = ..count..),
    stat = "count",
    vjust = 1.5,
    colour = "white"
  ) +
  labs(
    x = "Move Name",
    y = "Total Points Prevented",
    title = "Points Prevented",
    subtitle = "This shows which points I successfully defended"
  ) +
  theme_gray() +
  theme(
    plot.title = element_text(size = 16L, face = "bold"),
    axis.title.y = element_text(face = "bold"),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title.x = element_text(face = "bold")
    ```
![image](https://user-images.githubusercontent.com/74512335/149569999-8017bff5-2442-4f5b-9618-bfb421e23ea7.png)




