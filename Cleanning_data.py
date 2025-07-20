import pandas as pd 

def get_data(file_path): 
    df= pd.read_csv(file_path)
    df= df[df['Days with AQI']>=100]
    return df


df = get_data('annual_aqi_by_county_2024.csv')



def days_with_AQI_split(df): 
    columns_to_keep = [
        'State', 'County', 'Days with AQI', "Good Days",
        "Moderate Days", "Unhealthy for Sensitive Groups Days",
        "Unhealthy Days", "Very Unhealthy Days", "Hazardous Days",
    ]
    df = df[columns_to_keep]

    day_types = [
        "Good Days", "Moderate Days", "Unhealthy for Sensitive Groups Days",
        "Unhealthy Days", "Very Unhealthy Days", "Hazardous Days"
    ]
    df['Total Days'] = df[day_types].sum(axis=1)
    
    df_valid = df[df['Total Days'] == df['Days with AQI']]

    df_valid.drop(columns=['Total Days'], inplace=True)
    
    df_valid= df.rename(columns={"Days with AQI":"# Days Air Polution collected"})
    return df_valid


AQI_split= days_with_AQI_split(df)
AQI_split.to_csv('AQI_split_2024.csv', index=False)

def AQI_stats(df): 

    comlumns_to_keep= [
        'State', 'County',"Max AQI","90th Percentile AQI","Median AQI"
    ]
    df= df[comlumns_to_keep]

    return df 

AQI_stats_df = AQI_stats(df)

AQI_stats_df.to_csv("AQI_stats.csv", index= False)