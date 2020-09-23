import pandas as pd
import datetime
import numpy as np
import matplotlib.pyplot as plt

path = r'~/projects/SDTechHub/policeData/policeStopsData.csv'

df = pd.read_csv(path, dtype={'stop_id': int,
                            'pid': int,
                            'action': str,
                            'consented': str,
                            'basis_for_property_seizure': str,
                            'basis_for_search':	str,
                            'basis_for_search_explanation': str,
                            'disability': str,
                            'gender': str,
                            'type_of_property_seized': str,
                            'race':	str,
                            'reason_for_stop': str,
                            'reason_for_stop_code': str,
                            'reason_for_stop_code_text': str,
                            'reason_for_stop_detail': str,
                            'reason_for_stop_explanation': str,
                            'result_key': int,
                            'result': str,
                            'code':	float,
                            'result_text': str,
                            'ori': str,
                            'agency': str,
                            'exp_years': int,
                            'date_stop': object,
                            'time_stop': str,
                            'stop_duration': int,
                            'stop_in_response_to_cfs': int,
                            'officer_assignment_key': int,
                            'assignment': str,
                            'intersection':	str,
                            'address_block': float,
                            'landmark': str,
                            'address_street': str,
                            'highway_exit':	str,
                            'is_school': int,
                            'school_name': str,
                            'address_city': str,
                            'beat':	int,
                            'beat_name': str,
                            'is_student': int,
                            'perceived_limited_english': int,
                            'perceived_age': int,
                            'perceived_gender':	str,
                            'gender_nonconforming':	int,
                            'perceived_lgbt': str})

df['date_stop'] = pd.to_datetime(df['date_stop'])

# print(df.info())

collection = df[['exp_years', 'race', 'gender', 'disability']]

# print(collection.gender.sample(10))
# print(collection.gender.value_counts())

#create male binary field
condition = (collection['gender'] == 'Male') | (collection['gender'] == 'Transgender man/boy')
collection['gender_binary'] = np.where(condition, 1,0)

collection = collection.rename(columns={'gender_binary':'male'})

# print(collection.male.value_counts())

# create disability binary field
collection['disability'] = np.where(collection['disability'] == 'None', 0, 1)

# print(collection.disability.value_counts())

#create race binary variable

# print(collection.race.value_counts())

collection['black'] = np.where(collection['race'] == 'Black/African American', 1, 0)

# print(collection.black.value_counts())

collection = collection[['black', 'disability','male', 'exp_years']]

pd.plotting.scatter_matrix(collection, alpha=0.2)

plt.savefig('scatter.png')

plt.show()