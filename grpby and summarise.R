dist <- read.csv('C:\\Users\\Vikas\\OneDrive\\Desktop\\datasets\\District.csv')
View(dist)

colnames(stud)

library(dplyr)

grp_tbl<-dist%>% group_by(Dist.Name)
grp_tbl
View(grp_tbl)

agg_tbl <- grp_tbl %>% summarise(sum(PRIMARY.SECTOR.CONSTANT.PRICES..in.Millions.Rs.))
agg_tbl

## Note that the output of group_by() and summarise() is tibble hence,
## to convert it to data.frame use as.data.frame() function.

## Convert tibble to DataFrame
dist1 <- agg_tbl %>% as.data.frame()
dist1
View(dist1)


## combine in one step

agg1 <- dist %>% group_by(Dist.Name) %>% summarise(total_salary = sum(PRIMARY.SECTOR.CONSTANT.PRICES..in.Millions.Rs.))
View(agg1)

## both fxn in multiple columns

mul <- dist %>% group_by(Dist.Code,Dist.Name) %>% summarise(total_constant = sum(PRIMARY.SECTOR.CONSTANT.PRICES..in.Millions.Rs.),total_current= sum(PRIMARY.SECTOR.CURRENT.PRICES..in.Million.Rs.),.groups = 'drop')
mul                                                            
View(mul)                                                              
                                                              
      