import json
from pprint import pprint

with open('conflict_data_full_lined.json') as data_file:    
    conflict_raw = json.load(data_file)
    conflict_mexico = []
    for observations in conflict_raw:
        if observations['country']== "Mexico":
	        conflict_mexico.append(observations)
