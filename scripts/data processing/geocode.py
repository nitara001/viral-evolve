!pip install opencage
from opencage.geocoder import OpenCageGeocode
import pandas as pd

data = pd.read_csv('/content/drive/MyDrive/rabies_coords.csv')
  # get api key from:  https://opencagedata.com
key = 'ddda7e0f1a7843048c205b5f9afef55d'


# Function to get latitude and longitude for a given city and country
def get_lat_long(row):
    City = row['City']
    Country = row['Country']
    query = f"{City}, {Country}"

    results = geocoder.geocode(query)
    if len(results) > 0:
        lat = results[0]['geometry']['lat']
        long = results[0]['geometry']['lng']
        return pd.Series([lat, long])  # Return lat and long as a pandas Series
    else:
        return pd.Series([None, None])  # Return None for both lat and long

# Apply the function to the dataframe and create new columns 'lat' and 'lon'
data[['lat', 'lon']] = data.apply(get_lat_long, axis=1)

print(data)

