import pandas as pd

# actions taken
path = r'C:\Users\dillon\projects\SDTechHub\policeData\actionsTaken\ripa_actions_taken_datasd.csv'
actionsTaken = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'action': str,
                                  'consented': str})

# basis For Property Seizure
path = r'C:\Users\dillon\projects\SDTechHub\policeData\basisForPropertySeizure\ripa_prop_seize_basis_datasd.csv'
seizureBasis = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'basisforpropertyseizure': str})

# basis for search
path = r'C:\Users\dillon\projects\SDTechHub\policeData\basisForSearchesConducted\ripa_search_basis_datasd.csv'
searchBasis = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'basis_for_search': str,
                                'basis_for_search_explanation': str})

# disability
path = r'C:\Users\dillon\projects\SDTechHub\policeData\disabilityOfPersons\ripa_disability_datasd.csv'
disability = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'disability': str})

# gender
path = r'C:\Users\dillon\projects\SDTechHub\policeData\genderOfPersons\ripa_gender_datasd.csv'
gender = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'gender': str})

# property seized
path = r'C:\Users\dillon\projects\SDTechHub\policeData\propertySeized\ripa_prop_seize_type_datasd.csv'
propertySeized = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'type_of_propery_seized': str})

# race data
path = r'C:\Users\dillon\projects\SDTechHub\policeData\raceOfPersons\ripa_race_datasd.csv'
race = pd.read_csv(path, dtype={'stop_id': int,
                              'pid': int,
                             'race': str})

# reason for stop data
path = r'C:\Users\dillon\projects\SDTechHub\policeData\reasonForStop\ripa_stop_reason_datasd.csv'
reason = pd.read_csv(path, dtype={'stop_id': int,
                              'reason_for_stop': str,
                             'reason_for_stopcode': str,
                             'reason_for_stopcode_text': str,
                             'reason_for_stop_detail': str,
                             'reason_for_stop_explanation': str})

# stop result
path = r'C:\Users\dillon\projects\SDTechHub\policeData\resultOfStop\ripa_stop_result_datasd.csv'
stopResult = pd.read_csv(path, dtype={'stop_id': int,
                                  'pid': int,
                                'resultkey': int,
                                   'result': str,
                                   'code': float,
                             'resulttext': str})

# stop details
path = r'C:\Users\dillon\projects\SDTechHub\policeData\stopDetails\ripa_stops_datasd.csv'
datesToParse = ['date_stop','time_stop']
stopDetails = pd.read_csv(path, dtype={'stop_id': int,
                                  'ori': str,
                                 'agency': str,
                                 'exp_years': int,
                                 'date_stop': str,
                                 'time_stop': str,
                                 'stopduration': int,
                                 'stop_in_response_to_cfs': bool,
                                  'officer_assignment_key': int,
                                  'assignment': str,
                                  'intersection': str,
                                  'address_block': float,
                                  'land_mark': str,
                                  'address_street': str,
                                  'highway_exit':str,
                                  'isschool': bool,
                                  'address_city':str,
                                  'beat':int,
                                  'beat_name':str,
                                  'pid':int,
                                  'isstudent':bool,
                                  'perceived_limited_english': bool,
                                  'perceived_age': int,
                                  'perceived_gender': str,
                                  'gender_nonconforming': bool,
                                  'gend': int,
                                  'gend_nc': str,
                                  'perceived_lgbt': str})

dataframes = [reason, race, gender, disability, actionsTaken, seizureBasis, searchBasis, propertySeized, stopResult, stopDetails]

merged = reason.merge(race, on='stop_id', how ='left')
iterate = [gender, disability, actionsTaken, seizureBasis, searchBasis, propertySeized, stopResult, stopDetails]

for x in iterate:
    merged = merged.merge(x, on='stop_id', how ='left')

merged.sample(10)