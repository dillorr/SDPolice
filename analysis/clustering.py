import pandas as pd
import datetime
import numpy as np
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler


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

# print(df.head(10))         

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

## create race binary variable

# print(collection.race.value_counts())

collection['black'] = np.where(collection['race'] == 'Black/African American', 1, 0)

# print(collection.black.value_counts())

collection = collection[['black', 'disability','male', 'exp_years']]

# print(collection.head())
# print(collection.info())

scaler = StandardScaler()

collection_scaled = scaler.fit_transform(collection)

# print(df_scaled)

kmeans = KMeans(init='random', n_clusters=9, n_init=10)

kmeans.fit(collection_scaled)

clusters = kmeans.predict(collection_scaled)

collection_scaled_clustered = pd.DataFrame(collection_scaled, columns = collection.columns, index = collection.index)
collection_scaled_clustered['cluster'] = clusters

# print(collection_scaled_clustered.head())

# Run a number of tests, for 1, 2, ... num_clusters
# num_clusters = 50
# kmeans_tests = [KMeans(n_clusters=i, init='random', n_init=10) for i in range(1, num_clusters)]
# score = [kmeans_tests[i].fit(collection_scaled).score(collection_scaled) for i in range(len(kmeans_tests))]

# Score = [-1424823.999998947, -1065537.9197642414, -771743.5577497698, -447591.5304376416, -280703.28220621514, 
# -223377.37925983153, -182510.45630584552, -174592.75503945883, -115548.34537299641, -106198.30372332149, 
# -92304.24306796267, -83051.35184372186, -80779.90773912595, -63824.5782267096, -58558.300060872985, 
# -54023.370516640796, -41113.88732501312, -38735.56274523871, -36968.206784702656, -37685.60388632675, 
# -33313.096202013185, -28765.149612553505, -25299.823386389427, -28306.171356829513, -20576.822232501036, 
# -22235.455606607808, -19280.575880385833, -20814.504488452512, -16620.6720089459, -15983.264967647112, 
# -12446.03840395773, -12760.289487638362, -12805.03095489721, -13683.724648311001, -12404.278762428688, 
# -10063.491872102315, -9963.843559635177, -11107.647670419252, -7076.305697185193, -8319.29172951256, 
# -9301.10182163727, -8152.839059588284, -9210.854859301513, -6637.389200211503, -7113.290828008398, 
# -7534.918733670362, -6161.839183909708, -6116.865505959439, -6505.297990296431]
# choosing 9 clusters because of shelf from -174592.75503945883 and -115548.34537299641

print(collection_scaled_clustered.head())

collection_scaled_clustered.to_csv('~/projects/SDTechHub/analysis/clustering/collection_scaled_clustered.csv', index = False)