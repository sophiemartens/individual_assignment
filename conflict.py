import json
import csv

with open('conflict_data_full_lined.json', encoding= 'utf8') as data_file:    
    conflict_raw = json.load(data_file)
    conflict_mexico = []
    for observation in conflict_raw:
        if observation['country']== "Mexico":
	        conflict_mexico.append(observation)

header = []
for observation in conflict_mexico:
    for key in observation.keys():
        if key not in header:
            header.append(key)

with open('conflict_mexico.csv', 'w') as file:
    writer = csv.DictWriter(file, fieldnames=header, lineterminator='\n', delimiter=',')
    
    writer.writeheader()

    for observation in conflict_mexico:
        writer.writerow(observation)


