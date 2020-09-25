import pandas as pd
import datetime
import numpy as np

from sklearn.linear_model import LinearRegression

path = r'~/projects/SDTechHub/policeData/policeStopsData.csv'

df = pd.read_csv(path, dtype={'stop_id': int, 
                            'date_stop': object, 
                            'time_stop': str, 
                            'stop_duration': int, 
                            'stop_in_response_to_cfs': int, 
                            'address_city': str, 
                            'beat':	int, 
                            'beat_name': str, 
                            'highway_exit':	str, 
                            'address_street': str, 
                            'intersection':	str,
                            'address_block': float, 
                            'landmark': str, 
                            'is_school': int, 
                            'school_name': str, 
                            'ori': str, 
                            'agency': str,
                            'officer_assignment_key': int,
                            'assignment': str,
                            'exp_years': int, 
                            'pid': int, 
                            'is_student': int, 
                            'perceived_limited_english': int, 
                            'perceived_age': int,
                            'gender': str, 
                            'perceived_gender':	str, 
                            'gender_nc': int, 
                            'gender_nonconforming':	int, 
                            'gender': str, 
                            'perceived_lgbt': str,
                            'race':	str, 
                            'disability': str, 
                            'reason_for_stop_code': str, 
                            'reason_for_stop_code_text': str, 
                            'reason_for_stop': str,
                            'reason_for_stop_detail': str, 
                            'reason_for_stop_explanation': str,
                            'action': str,
                            'consented': str,
                            'basis_for_search':	str,
                            'basis_for_search_explanation': str,
                            'basis_for_property_seizure': str,
                            'type_of_property_seized': str,
                            'result_key': str, # have to use str here because of possible entry errors
                            'result': str,
                            'code':	float,
                            'result_text': str})
     

df['date_stop'] = pd.to_datetime(df['date_stop'])

#create male binary field
condition = (df['gender'] == 'Male') | (df['gender'] == 'Transgender man/boy')
df['male'] = np.where(condition, 1,0)

#disability binary
df['disabled'] = np.where(df['disability'] == 'None', 0, 1)

#black binary
df['black'] = np.where(df['race'] == 'Black/African American', 1, 0)

print(df.columns)