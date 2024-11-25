
## nRtsom

The `{nRtsom}` (near real time storm overflow monitoring) package is designed to 
help interact with the data provided via the  [‘National Storm Overflow Hub’](https://www.streamwaterdata.co.uk/pages/storm-overflows-data)
(NSOH herein). 

## Installation

To install the latest release of `{nRtsom}` use the following code:

``` r
install.packages("devtools")
library(devtools)
install_github("a-jone5/nRtsom")
library(nRtsom)
```

## Functions

There are currently three functions in the `{nRtsom}` package:

- the `urls` function that simply makes urls available

- the `single_company` function will let you access data from one company
    - Provides access to and reformats:
      - all time stamps from unix to ISO8601
      - all character strings to lower case (including column headers)
      - status from numeric (-1,0,1) to character (offline,end,start)

- the `all_company` function will let you access data from every company,
and uses the function above to format. Aligns all columns for consistency.


## Workflows

Find the url you are interested in, and use it with the `single_company`

``` r
library(nRtsom)

## show all
urls()

## assign one
url <- urls()$yorkshire

## assign the data for the url you are interested in 
df <- single_company(url)

```
alternatively call all the data in one go

``` r
library(nRtsom)

df <- all_company()

```

## Things on the horizon

- Integration with other data sets - although examples of this may sit better in another repo
- Some summary functions

## Data Sources

The data is made available through the [‘NSOH’](https://www.streamwaterdata.co.uk/pages/storm-overflows-data) via [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Companies that have published or made a data set available on the NSOH are each responsible for that data set. See more [here](https://www.streamwaterdata.co.uk/pages/the-national-storm-overflow-hub#:~:text=Parties%20that%20have,by%20another%20party)





