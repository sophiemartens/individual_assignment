import json
from pprint import pprint

with open('conflict_data_full_lined.json') as data_file:    
    conflict_raw = json.load(data_file)
    conflict_raw_glimpse = conflict_raw[1]
pprint(conflict_raw_glimpse)