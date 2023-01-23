# ERDs for Chicago and Denver Crime Data
## Version 1
The structure of these datasets are similar: the facts being measured are individual crimes and the dimensions are time, location, and type of crime. Location and type of crime can in principle be sorted into dimension tables.  

### Denver
![ERD-Denver](../img/den_ERD.png)
### Chicago
![ERD-Chicago](../img/chi_ERD.png)

I first noticed that the Chicago dataset was less amenable to denormalization than I thought. Contrary to what you might expect, there is no 1-to-1 association between any location metric or subgroup of location metrics from which you could connect to a location table. One set of coordinates can connect to multiple police beats (to a maximum of 20!), a single police beat to multiple districts, etc. It's unclear looking at this dataset alone whether this is partially due to changes in how CPD designated area boundaries or  inaccuracies in data entry. 

## Version 2
### Denver
![ERD-Denver](../img/den_ERD_v2.png)

Unfortunately, I then saw that the Denver dataset suffers from the same issues when I tried to make a location dimension table for it as well. Better to just make a dimension table for the offenses.  

## Final Version

The following diagram illustrates the final version of the pipeline, from source data to staging tables, dimension tables, and then monthly aggregation tables. 

![both versions](../img/version3_ERD.png)
