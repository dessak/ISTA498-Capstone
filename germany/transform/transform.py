"""
__author__ = "Nate Cutler"
__credits__ = ["Data sourced from Bundesamt fur Strahlenschutz"]
__email__ = "ncutler211@gmail.com"
"""

# Imports
import pandas as pd
import os
import numpy as np
import matplotlib.pyplot as plt
import psycopg2
from sqlalchemy import create_engine

def read_data_into_dataframe(directory):
    """
    Reads data from .dat files in a specified directory into a Pandas DataFrame and combines them.

    Parameters:
        directory (str): The path to the directory containing the .dat files.

    Returns:
        pd.DataFrame: A combined DataFrame with data from all .dat files in the directory.

    Example:
        directory = "F:/UofA/ISTA_498_Capstone/Data ETL/Germany/Extract/data/Uncompressed Original"
        combined_data = read_data_into_dataframe(directory)
    """
    datafiles = []

    # Iterate over each .dat file in the specified directory
    for filename in os.listdir(directory):
        if filename.endswith(".dat"):
            file_path = os.path.join(directory, filename)

            # Read the .dat file into a DataFrame, specifying delimiter and encoding
            df = pd.read_csv(file_path, delimiter='|', encoding='latin1')

            # Rename the DataFrame columns to standard names
            new_column_names = ["Postal code", "city", "start_date", "reading"]
            df.rename(columns=dict(zip(df.columns, new_column_names)), inplace=True)

            # Append the DataFrame to the list of datafiles
            datafiles.append(df)

    # Combine all DataFrames into a single DataFrame
    combined_data = pd.concat(datafiles, ignore_index=True)

    return combined_data

def transformations(combined_data):
    """
    Perform data transformations on a Pandas DataFrame.

    This function applies several transformations to the input DataFrame to prepare it for further analysis or storage.

    Parameters:
        combined_data (pd.DataFrame): The input DataFrame to be transformed.

    Returns:
        pd.DataFrame: The transformed DataFrame.
    """
    # Create unit column with microsievert per hour
    combined_data["unit"] = 'μSv/h'
    # Drop Postal Code column
    combined_data = combined_data.drop("Postal code", axis=1)
    # Convert Date column to datetime
    combined_data['start_date'] = pd.to_datetime(combined_data['start_date'])
    # Add End_Date column. All data is daily data, so no need for sampling over time.
    combined_data['end_date'] = combined_data['start_date']
    # Add CID column
    combined_data['cid'] = '04'
    # Add State column (it's initially empty)
    combined_data['state'] = ""
    # Add Latitude column (initially filled with NaN)
    combined_data['lat'] = np.nan
    # Add Longitude column (initially filled with NaN)
    combined_data['long'] = np.nan
    # Add Comment column (it's initially empty)
    combined_data['comment'] = ""
    # Reorganize columns to a specific order
    combined_data = combined_data[["start_date", "end_date", "reading", "unit", "city", "state", "cid", "lat", "long", "comment"]]
    return combined_data

def plot1(transformed_data):
    # Resample the data to a monthly average
    resampled_data = transformed_data.resample('M', on='start_date').mean()

    # Create the area plot
    plt.figure(figsize=(10, 6))  # Adjust the figure size as needed
    plt.fill_between(resampled_data.index, resampled_data['reading'], alpha=0.5)
    plt.xlabel('Date')
    plt.ylabel('Daily Average Reading')
    plt.title('Daily Average Reading Over Time')
    plt.grid(True)
    plt.show()



def main():
    directory = r"F:\UofA\ISTA_498_Capstone\Data ETL\Germany\Extract\data\Uncompressed Original"
    combined_data = read_data_into_dataframe(directory)
    transformed_data = transformations(combined_data)
    plot1(transformed_data)
    plot1()