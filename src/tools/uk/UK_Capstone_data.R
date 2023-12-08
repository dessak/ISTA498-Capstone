
#title: "ISTA 498 Senior Capstone Project"
#author: "Michael Lord"
#date: "Fall 2023"

if (!require(pacman))
  install.packages("pacman")

pacman::p_load(knitr, tidyverse, janitor, here, lubridate)
opts_chunk$set(echo = TRUE)


# September 2023 ----------------------------------------------------------
#read data in
sept_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-sep-2023.csv"))
sept_2023_processed <- sept_2023 |>
  #Renaming columns, replacing colnames
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  #REMOVING COLUMNS 8-10, replacing [ , -c(8, 9, 10)].
  select(-c(8:10))|>
  #Creating new columns as needed. 
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'), 
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         #Using NA, because of how R treats missing values.
         CITY = NA,
         STATE = NA)
write.csv(sept_2023_processed, here("data",  "processed", "sept_2023_processed.csv"), row.names = FALSE)

sept_2023_complete <- sept_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

  #group_by(DATE_QT) |>
  #mutate(AVG_READ_QT = mean(READING)) |>
  #group_by(DATE_Y) |>
  #mutate(AVG_READ_Y = mean(READING))
  

# August 2023 -------------------------------------------------------------
#read data in
aug_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-aug-2023.csv"))
aug_2023_processed <- aug_2023 |>
  #renaming columns
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
#removing columns 8-10
  select(-c(8:10)) |>
  #creating new columns
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(aug_2023_processed, here("data",  "processed", "aug_2023_processed.csv"), row.names = FALSE)

aug_2023_complete <- aug_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# July 2023 ---------------------------------------------------------------
#read data in
july_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-jul-2023.csv"))
july_2023_processed <- july_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(july_2023_processed, here("data",  "processed", "july_2023_processed.csv"), row.names = FALSE)

july_2023_complete <- july_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# June 2023 ---------------------------------------------------------------
#read data in
june_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-jun-2023.csv"))
june_2023_processed <- june_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(june_2023_processed, here("data",  "processed", "june_2023_processed.csv"), row.names = FALSE)

june_2023_complete <- june_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# May 2023 ----------------------------------------------------------------
#read data in
may_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-may-2023.csv"))
may_2023_processed <- may_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:11)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(may_2023_processed, here("data",  "processed", "may_2023_processed.csv"), row.names = FALSE)

may_2023_complete <- may_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# April 2023 --------------------------------------------------------------
#read data in
april_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-apr-2023.csv"))
april_2023_processed <- april_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:11)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(april_2023_processed, here("data",  "processed", "april_2023_processed.csv"), row.names = FALSE)

april_2023_complete <- april_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# March 2023 --------------------------------------------------------------
#read data in
march_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-mar-2023.csv"))
march_2023_processed <- march_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(march_2023_processed, here("data",  "processed", "march_2023_processed.csv"), row.names = FALSE)

march_2023_complete <- march_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# February 2023 -----------------------------------------------------------
feb_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-mar-2023.csv"))
feb_2023_processed <- feb_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(feb_2023_processed, here("data",  "processed", "feb_2023_processed.csv"), row.names = FALSE)

feb_2023_complete <- feb_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# January 2023 ------------------------------------------------------------
jan_2023 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-rrems-monitors-mar-2023.csv"))
jan_2023_processed <- jan_2023 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(jan_2023_processed, here("data",  "processed", "jan_2023_processed.csv"), row.names = FALSE)

jan_2023_complete <- jan_2023_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# December 2022 -----------------------------------------------------------
dec_2022 <- read_csv(here("data", "dec_2022_ambient_gamma_dose_rates_across_the_UK_fixed_rrems_monitors.csv"))
dec_2022_processed <- dec_2022 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:11)) |>
  mutate(Unit = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(dec_2022_processed, here("data",  "processed", "dec_2022_processed.csv"), row.names = FALSE)

dec_2022_complete <- dec_2022_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# November 2022 -----------------------------------------------------------
nov_2022 <- read_csv(here("data", "./nov_2022_ambient_gamma_dose_rates_across_the_UK_fixed_rrems_monitors.csv"))
nov_2022_processed <- nov_2022 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(nov_2022_processed, here("data",  "processed", "nov_2022_processed.csv"), row.names = FALSE)

nov_2022_complete <- nov_2022_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# September 2022 ----------------------------------------------------------
sept_2022 <- read_csv(here("data", "sep_2022_ambient_gamma_dose_rates_across_the_UK_fixed_rrems_monitors.csv"))
sept_2022_processed <- sept_2022 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(sept_2022_processed, here("data",  "processed", "sept_2022_processed.csv"), row.names = FALSE)

sept_2022_complete <- sept_2022_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# August 2022 -------------------------------------------------------------
aug_2022 <- read_csv(here("data", "aug_2022_ambient_gamma_dose_rates_across_the_UK_fixed_rrems_monitors.csv"))
aug_2022_processed <- aug_2022 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(aug_2022_processed, here("data",  "processed", "aug_2022_processed.csv"), row.names = FALSE)

aug_2022_complete <- aug_2022_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# July 2022 ---------------------------------------------------------------
july_2022 <- read_csv(here("data", "jul_2022_ambient_gamma_dose_rates_across_the_UK_fixed_rrems_monitors.csv"))
july_2022_processed <- july_2022 |>
  rename("START_DATE" = 1, "LAT" = 2, "LONG" = 3, "READING" = 4, "COMMENT" = 5, "UNIT" = 6, "CID" = 7) |>
  select(-c(8:10)) |>
  mutate(UNIT = str_replace(UNIT, '\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         END_DATE = START_DATE,
         CID = "02",
         CITY = NA,
         STATE = NA)
write.csv(july_2022_processed, here("data",  "processed", "july_2022_processed.csv"), row.names = FALSE)

july_2022_complete <- july_2022_processed |>
  mutate(START_DATE = as.Date(START_DATE, "%d/%m/%y"),
         DATE_QT = floor_date(START_DATE, unit = "quarter"),
         DATE_Y = floor_date(START_DATE, unit = "year"))

# April-June 2022 ---------------------------------------------------------------
q2_2022 <- read_csv(here("data","rimnet-fixed-monitors-summary-apr-jun-2022.csv"))
q2_2022_processed <- q2_2022 |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4,6,7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2022, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2022, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2022_processed, here("data",  "processed", "q2_2022_processed.csv"), row.names = FALSE)

q2_2022_complete <- q2_2022_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"))

# 4th quarter 2021------------------------------------------------------------
q4_2021 <- read_csv(here("data", "rimnet-fixed-monitors-summary-oct-dec-2021.csv"))
q4_2021_processed <- q4_2021 |>
  #Removing rows 1-3, replacing [-c(1, 2, 3), ]
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2021, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2021, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2021_processed, here("data",  "processed", "q4_2021_processed.csv"), row.names = FALSE)

q4_2021_complete <- q4_2021_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2021----------------------------------------------------------
q3_2021 <- read_csv(here("data", "ambient-gamma-dose-rates-fixed-july-september-2021.csv"))
q3_2021_processed <- q3_2021 |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4,6,7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2021, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2021, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2021_processed, here("data",  "processed", "q3_2021_processed.csv"), row.names = FALSE)

q3_2021_complete <- q3_2021_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))
# 2nd quarter 2021 --------------------------------------------------------
q2_2021 <- read_csv(here("Data", "april-june-2021-ambient-gamma-dose-rates-uk-fixed.csv"))
q2_2021_processed <- q2_2021 |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2021, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2021, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2021_processed, here("data",  "processed", "q2_2021_processed.csv"), row.names = FALSE)

q2_2021_complete <- q2_2021_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2021 --------------------------------------------------------
q1_2021 <- read_csv(here("data", "rimnet-fixed-monitors-summary-jan-mar-2021.csv"))
q1_2021_processed <- q1_2021 |>
  slice(-c(1)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2021, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2021, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2021_processed, here("data",  "processed", "q1_2021_processed.csv"), row.names = FALSE)

q1_2021_complete <- q1_2021_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2020------------------------------------------------------------
q4_2020 <- read_csv(here("data", "rimnet-fixed-monitors-summary-oct-dec-2020.csv"))
q4_2020_processed <- q4_2020 |>
  slice(-c(1)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2020, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2020, 12, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2020_processed, here("data",  "processed", "q4_2020_processed.csv"), row.names = FALSE)

q4_2020_complete <- q4_2020_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2020----------------------------------------------------------
q3_2020 <- read_csv(here("data", "rimmet-fixed-monitors-summary-july-september-2020.csv")) 
q3_2020_processed <- q3_2020 |>
  slice(-c(1)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2020, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2020, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2020_processed, here("data",  "processed", "q3_2020_processed.csv"), row.names = FALSE)

q3_2020_complete <- q3_2020_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))
# 2nd quarter 2020--------------------------------------------------------
q2_2020 <- read_csv(here("data", "rimnet-fixed-monitors-summary-apr-jun-2020.csv")) 
q2_2020_processed <- q2_2020 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2020, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2020, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2020_processed, here("data",  "processed", "q2_2020_processed.csv"), row.names = FALSE)

q2_2020_complete <- q2_2020_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2020--------------------------------------------------------
q1_2020 <- read_csv(here("data", "rimnet-fixed-monitors-summary-jan-mar-2020.csv"))
q1_2020_processed <- q1_2020 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2020, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2020, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2020_processed, here("data",  "processed", "q1_2020_processed.csv"), row.names = FALSE)

q1_2020_complete <- q1_2020_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2019------------------------------------------------------------
q4_2019 <- read_csv(here("data", "rimnet-fixed-monitors-summary-oct-dec2019.csv"))
q4_2019_processed <- q4_2019 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2019, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2019, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2019_processed, here("data",  "processed", "q4_2019_processed.csv"), row.names = FALSE)

q4_2019_complete <- q4_2019_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2019----------------------------------------------------------
q3_2019 <- read_csv(here("data", "Ambient_gamma_radiation_dose_rates_-_fixed_RIMNET_monitors_-_July-September_2019.csv"))
q3_2019_processed <- q3_2019 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2019, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2019, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2019_processed, here("data",  "processed", "q3_2019_processed.csv"), row.names = FALSE)

q3_2019_complete <- q3_2019_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))


# 2nd quarter 2019--------------------------------------------------------
q2_2019 <- read_csv(here("data", "Ap-Jun_2019-RIMNET__fixed_Monitors.csv"))
q2_2019_processed <- q2_2019 |>
  #Removing rows 1-3, replacing [-c(1, 2, 3), ]
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2019, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2019, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2019_processed, here("data",  "processed", "q2_2019_processed.csv"), row.names = FALSE)

q2_2019_complete <- q2_2019_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2019--------------------------------------------------------
q1_2019 <- read_csv(here("data", "Jan-Mar_2019_ambient_gamma_dose_rates_across_the_UK__RIMNET_Fixed_Monitors.csv"))
q1_2019_processed <- q1_2019 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2019, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2019, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2019_processed, here("data",  "processed", "q1_2019_processed.csv"), row.names = FALSE)

q1_2019_complete <- q1_2019_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))


# 4th quarter 2018------------------------------------------------------------
q4_2018 <- read_csv(here("data", "rimnet-fixed-monitors-oct-dec-2018.csv"))
q4_2018_processed <- q4_2018 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2018, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2018, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2018_processed, here("data",  "processed", "q4_2018_processed.csv"), row.names = FALSE)

q4_2018_complete <- q4_2018_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2018----------------------------------------------------------
q3_2018 <- read_csv(here("data", "rimnet-fixed-monitors-jul-sep-2018.csv"))
q3_2018_processed <- q3_2018 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2018, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2018, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2018_processed, here("data",  "processed", "q3_2018_processed.csv"), row.names = FALSE)

q3_2018_complete <- q3_2018_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2018--------------------------------------------------------
q2_2018 <- read_csv(here("data", "Apr-Jun_2018_ambient_gamma_dose_rates_across_the_UK_fixed_RIMNET_monitors.csv"))
q2_2018_processed <- q2_2018 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2018, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2018, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2018_processed, here("data",  "processed", "q2_2018_processed.csv"), row.names = FALSE)

q2_2018_complete <- q2_2018_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2018--------------------------------------------------------
q1_2018 <- read_csv(here("data", "Jan-Mar_2018_ambient_gamma_dose_rates_across_the_UK__fixed_RIMNET_monitors_.csv"))
q1_2018_processed <- q1_2018 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2018, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2018, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2018_processed, here("data",  "processed", "q1_2018_processed.csv"), row.names = FALSE)

q1_2018_complete <- q1_2018_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2017------------------------------------------------------------
q4_2017 <- read_csv(here("data", "rimnet-2017-q4-oct-dec-fixed-monitors.csv"))
q4_2017_processed <- q4_2017 |>
  slice(-c(1:3)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2017, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2017, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2017_processed, here("data",  "processed", "q4_2017_processed.csv"), row.names = FALSE)

q4_2017_complete <- q4_2017_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2017----------------------------------------------------------
q3_2017 <- read_csv(here("data", "rimnet-2017-q3-jul-sep-fixed-monitors.csv"))
q3_2017_processed <- q3_2017 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2017, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2017, 9, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2017_processed, here("data",  "processed", "q3_2017_processed.csv"), row.names = FALSE)

q3_2017_complete <- q3_2017_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2017--------------------------------------------------------
q2_2017 <- read_csv(here("data", "rimnet-2017-q2-apr-jun-fixed-monitors.csv"))
q2_2017_processed <- q2_2017 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2017, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2017, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2017_processed, here("data",  "processed", "q2_2017_processed.csv"), row.names = FALSE)

q2_2017_complete <- q2_2017_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2017--------------------------------------------------------
q1_2017 <- read_csv(here("data", "rimnet-2017-q1-jan-mar-fixed-monitors.csv"))
q1_2017_processed <- q1_2017 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2017, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2017, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2017_processed, here("data",  "processed", "q1_2017_processed.csv"), row.names = FALSE)

q1_2017_complete <- q1_2017_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2016------------------------------------------------------------
q4_2016 <- read_csv(here("data", "rimnet-2016-q4-oct-dec-fixed-monitors.csv"))
q4_2016_processed <- q4_2016 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2016, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2016, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2016_processed, here("data",  "processed", "q4_2016_processed.csv"), row.names = FALSE)

q4_2016_complete <- q4_2016_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2016----------------------------------------------------------
q3_2016 <- read_csv(here("data", "rimnet-2016-q3-jul-sep-fixed-monitors.csv"))
q3_2016_processed <- q3_2016 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2016, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2016, 9, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2016_processed, here("data",  "processed", "q3_2016_processed.csv"), row.names = FALSE)

q3_2016_complete <- q3_2016_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2016--------------------------------------------------------
q2_2016 <- read_csv(here("data", "rimnet-2016-q2-apr-jun-fixed-monitors.csv"))
q2_2016_processed <- q2_2016 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2016, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2016, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2016_processed, here("data",  "processed", "q2_2016_processed.csv"), row.names = FALSE)

q2_2016_complete <- q2_2016_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2016--------------------------------------------------------
q1_2016 <- read_csv(here("data", "rimnet-2016-q1-jan-mar-fixed-monitors.csv"))
q1_2016_processed <- q1_2016 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2016, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2016, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2016_processed, here("data",  "processed", "q1_2016_processed.csv"), row.names = FALSE)

q1_2016_complete <- q1_2016_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2015------------------------------------------------------------
q4_2015 <- read_csv(here("data", "Quarter_4_2015_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q4_2015_processed <- q4_2015 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2015, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2015, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2015_processed, here("data",  "processed", "q4_2015_processed.csv"), row.names = FALSE)

q4_2015_complete <- q4_2015_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2015----------------------------------------------------------
q3_2015 <- read_csv(here("data", "Quarter_3_2015_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q3_2015_processed <- q3_2015 |>
  slice(-c(1:2)) |>
  rename("CITY" = 1, "UNIT" = 2, "COMMENT" = 3, "S" = 4, "READING" = 5, "Max" = 6, "Min" = 7) |>
  select(-c(4, 6, 7)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2015, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2015, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2015_processed, here("data",  "processed", "q3_2015_processed.csv"), row.names = FALSE)

q3_2015_complete <- q3_2015_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2015--------------------------------------------------------
q2_2015 <- read_csv(here("data", "Quarter_2_2015_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q2_2015_processed <- q2_2015 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2015, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2015, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2015_processed, here("data",  "processed", "q2_2015_processed.csv"), row.names = FALSE)

q2_2015_complete <- q2_2015_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2015--------------------------------------------------------
q1_2015 <- read_csv(here("data", "Quarter_1_2015_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q1_2015_processed <- q1_2015 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2015, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2015, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2015_processed, here("data",  "processed", "q1_2015_processed.csv"), row.names = FALSE)

q1_2015_complete <- q1_2015_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2014------------------------------------------------------------
q4_2014 <- read_csv(here("data", "Quarter_4_2014_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q4_2014_processed <- q4_2014 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2014, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2014, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2014_processed, here("data",  "processed", "q4_2014_processed.csv"), row.names = FALSE)

q4_2014_complete <- q4_2014_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2014----------------------------------------------------------
q3_2014 <- read_csv(here("data", "Quarter_3_2014_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q3_2014_processed <- q3_2014 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2014, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2014, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2014_processed, here("data",  "processed", "q3_2014_processed.csv"), row.names = FALSE)

q3_2014_complete <- q3_2014_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2014--------------------------------------------------------
q2_2014 <- read_csv(here("data","Quarter_2_2014_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q2_2014_processed <- q2_2014 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2014, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2014, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2014_processed, here("data",  "processed", "q2_2014_processed.csv"), row.names = FALSE)

q2_2014_complete <- q2_2014_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2014--------------------------------------------------------
q1_2014 <- read_csv(here("data", "Quarter_1_2014_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q1_2014_processed <- q1_2014 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2014, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2014, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2014_processed, here("data",  "processed", "q1_2014_processed.csv"), row.names = FALSE)

q1_2014_complete <- q1_2014_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2013------------------------------------------------------------
q4_2013 <- read_csv(here("data", "Quarter_4_2013_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q4_2013_processed <- q4_2013 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:7)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2013, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2013, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2013_processed, here("data",  "processed", "q4_2013_processed.csv"), row.names = FALSE)

q4_2013_complete <- q4_2013_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2013----------------------------------------------------------
q3_2013 <- read_csv(here("data", "Quarter_3_2013_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q3_2013_processed <- q3_2013 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:7)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2013, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2013, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2013_processed, here("data",  "processed", "q3_2013_processed.csv"), row.names = FALSE)

q3_2013_complete <- q3_2013_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2013--------------------------------------------------------
q2_2013 <- read_csv(here("data", "Quarter_2_2013_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q2_2013_processed <- q2_2013 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:7)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE <- ISOdatetime(2013, 4, 1, 0, 0, 0),
         END_DATE <- ISOdatetime(2013, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2013_processed, here("data",  "processed", "q2_2013_processed.csv"), row.names = FALSE)

q2_2013_complete <- q2_2013_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2013--------------------------------------------------------
q1_2013 <- read_csv(here("data", "Quarter_1_2013_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q1_2013_processed <- q1_2013 |>
  slice(-c(1:8)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2013, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2013, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2013_processed, here("data",  "processed", "q1_2013_processed.csv"), row.names = FALSE)

q1_2013_complete <- q1_2013_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2012------------------------------------------------------------
q4_2012 <- read_csv(here("data", "Quarter_4_2012_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q4_2012_processed <- q4_2012 |>
  slice(-c(1:8)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2012, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2012, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2012_processed, here("data",  "processed", "q4_2012_processed.csv"), row.names = FALSE)

q4_2012_complete <- q4_2012_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2012----------------------------------------------------------
q3_2012 <- read_csv(here("data", "Quarter_3_2012_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q3_2012_processed <- q3_2012 |>
  slice(-c(1:8)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2012, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2012, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2012_processed, here("data",  "processed", "q3_2012_processed.csv"), row.names = FALSE)

q3_2012_complete <- q3_2012_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2012--------------------------------------------------------
q2_2012 <- read_csv(here("data", "Quarter_2_2012_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q2_2012_processed <- q2_2012 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2012, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2012, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2012_processed, here("data",  "processed", "q2_2012_processed.csv"), row.names = FALSE)

q2_2012_complete <- q2_2012_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2012--------------------------------------------------------
q1_2012 <- read_csv(here("data", "Quarter_1_2012_ambient_gamma_radiation_dose_rates_across_the_UK.csv"))
q1_2012_processed <- q1_2012 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2012, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2012, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2012_processed, here("data",  "processed", "q1_2012_processed.csv"), row.names = FALSE)

q1_2012_complete <- q1_2012_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 4th quarter 2011------------------------------------------------------------
q4_2011 <- read_csv(here("data", "quarter-4-2011-rimnet-stats.csv"))
q4_2011_processed <- q4_2011 |>
  slice(-c(1:7)) |>
  rename("CITY" = 1, "COMMENT" = 2, "R" = 3, "READING" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(3, 5, 6, 7)) |>
  mutate(UNIT = "µGy/h",
         COMMENT = paste0("site_norm: ", COMMENT),
         START_DATE = ISOdatetime(2011, 10, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2011, 12, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q4_2011_processed, here("data",  "processed", "q4_2011_processed.csv"), row.names = FALSE)

q4_2011_complete <- q4_2011_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 3rd quarter 2011----------------------------------------------------------
q3_2011 <- read_csv(here("data", "quarter-3-2011-rimnet-stats.csv"))
q3_2011_processed <- q3_2011 |>
  rename("CITY" = 1, "UNIT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", NA),
         START_DATE = ISOdatetime(2011, 7, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2011, 9, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q3_2011_processed, here("data",  "processed", "q3_2011_processed.csv"), row.names = FALSE)

q3_2011_complete <- q3_2011_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 2nd quarter 2011--------------------------------------------------------
q2_2011 <- read_csv(here("data", "quarter-2-2011-rimnet-stats.csv"))
q2_2011_processed <- q2_2011 |>
  rename("CITY" = 1, "UNIT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", NA),
         START_DATE = ISOdatetime(2011, 4, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2011, 6, 30, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q2_2011_processed, here("data",  "processed", "q2_2011_processed.csv"), row.names = FALSE)

q2_2011_complete <- q2_2011_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))

# 1st quarter 2011--------------------------------------------------------
q1_2011 <- read_csv(here("data", "quarter-1-2011-rimnet-stats.csv"))
q1_2011_processed <- q1_2011 |>
  rename("CITY" = 1, "UNIT" = 2, "READING" = 3, "R" = 4, "Max" = 5, "Min" = 6) |>
  select(-c(4:6)) |>
  mutate(UNIT = str_replace(UNIT,'\xb5','µ'),
         COMMENT = paste0("site_norm: ", NA),
         START_DATE = ISOdatetime(2011, 1, 1, 0, 0, 0),
         END_DATE = ISOdatetime(2011, 3, 31, 0, 0, 0),
         CID = "02",
         LAT = NA,
         LONG = NA,
         STATE = NA)
write.csv(q1_2011_processed, here("data",  "processed", "q1_2011_processed.csv"), row.names = FALSE)

q1_2011_complete <- q1_2011_processed |>
  pivot_longer(cols = contains("DATE"),
               names_to = "DATE_TYPE", values_to = "DATE") |>
  mutate(DATE = as.Date(DATE, tryFormats = "%y-%m-%d"),
         DATE_QT = floor_date(DATE, unit = "quarter"),
         DATE_Y = floor_date(DATE, unit = "year"),
         READING = as.numeric(READING))


#group_by(DATE_QT) |>
#mutate(AVG_READ_QT = mean(READING)) |>
#group_by(DATE_Y) |>
#mutate(AVG_READ_Y = mean(READING))

complete_data <- full_join(sept_2023_complete, aug_2023_complete) |>
  full_join(july_2023_complete) |>
  full_join(june_2023_complete) |>
  full_join(may_2023_complete) |>
  full_join(april_2023_complete) |>
  full_join(march_2023_complete) |>
  full_join(feb_2023_complete) |>
  full_join(jan_2023_complete) |>
  full_join(dec_2022_complete) |>
  full_join(nov_2022_complete) |>
  full_join(sept_2022_complete) |>
  full_join(aug_2022_complete) |>
  full_join(july_2022_complete) |>
  full_join(q2_2022_complete) |>
  full_join(q4_2021_complete) |>
  full_join(q3_2021_complete) |>
  full_join(q2_2021_complete) |>
  full_join(q1_2021_complete) |>
  full_join(q4_2020_complete) |>
  full_join(q3_2020_complete) |>
  full_join(q2_2020_complete) |>
  full_join(q1_2020_complete) |>
  full_join(q4_2019_complete) |>
  full_join(q3_2019_complete) |>
  full_join(q2_2019_complete) |>
  full_join(q1_2019_complete) |>
  full_join(q4_2018_complete) |>
  full_join(q3_2018_complete) |>
  full_join(q2_2018_complete) |>
  full_join(q1_2018_complete) |>
  full_join(q4_2017_complete) |>
  full_join(q3_2017_complete) |>
  full_join(q2_2017_complete) |>
  full_join(q1_2017_complete) |>
  full_join(q4_2016_complete) |>
  full_join(q3_2016_complete) |>
  full_join(q2_2016_complete) |>
  full_join(q1_2016_complete) |>
  full_join(q4_2015_complete) |>
  full_join(q3_2015_complete) |>
  full_join(q2_2015_complete) |>
  full_join(q1_2015_complete) |>
  full_join(q4_2014_complete) |>
  full_join(q3_2014_complete) |>
  full_join(q2_2014_complete) |>
  full_join(q1_2014_complete) |>
  full_join(q4_2013_complete) |>
  full_join(q3_2013_complete) |>
  full_join(q2_2013_complete) |>
  full_join(q1_2013_complete) |>
  full_join(q4_2012_complete) |>
  full_join(q3_2012_complete) |>
  full_join(q2_2012_complete) |>
  full_join(q1_2012_complete) |>
  full_join(q4_2011_complete) |>
  full_join(q3_2011_complete) |>
  full_join(q2_2011_complete) |>
  full_join(q1_2011_complete)

quarterly_full <- complete_data |>
  select(-DATE_Y, -AVG_READ_Y, -READING, -DATE, -DATE_TYPE) |>
  distinct()
yearly_full <- complete_data |>
  select(-DATE_QT, -AVG_READ_QT, -READING, -DATE, -DATE_TYPE) |>
  distinct()

