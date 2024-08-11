# United States RADNet Data and Analysis
## Contributer: Dessa Keys

This module uses the EPA's RADNet data available at https://www.epa.gov/radnet/radnet-csv-file-downloads to collect all historical data for gamma gross count rate for the United States.

### Extract
  * Downloaded all available .zip files available form RADNet
  * Used [fileconcatination.ipynb](https://github.com/dessak/ISTA498-Capstone/blob/main/US/FileConcatination.ipynb) to:
      - Extract contents of .zip files
      - Read .csv files into single dataframe
      - Save dataframe as SQLite database
### Transform
Using [Capstone_Notebook.ipynb](https://github.com/dessak/ISTA498-Capstone/blob/main/US/Capstone_Notebook.ipynb) (Google Collab Notebook):
  * Seperated in Gamma Count Values (GCM) and Dose Equivalent Rate (DER) tables
  * Removed rows that had NaNs
  * Gamma counts were averaged into 'Counts per minute mean'
  * Counts per minute mean and does equivalent rates were averaged into dialy values
  * Due to large diferences in values by location, values were converted into z-scores
### Load
  * Values were loaded into Tableau Public
  * Dashboard was created with [map visualization](https://public.tableau.com/app/profile/dessa2111/viz/ProjectRadiance/Map)

### Insights
While events like the Fukushima Daiichi nuclear accident had no apparent affect on levels in the US, seasonal flucuations became apparent. Large gaps in readings exist and can be seen in the below examples for Chicago, IL.

![Dose Equivalent Rate](https://github.com/dessak/ISTA498-Capstone/blob/main/US/Chicago_DER.png)
![Gamma Count Rate](https://github.com/dessak/ISTA498-Capstone/blob/main/US/Chicago_GCR.png)
