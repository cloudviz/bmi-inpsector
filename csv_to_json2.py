import csv, json,sys
outputFrame=sys.argv[1]
indexOfJsonfile=sys.argv[2]
file  = open(outputFrame, "r")
reader = csv.reader(file, delimiter="\n")
list_d = []
i = 0
counter = 0
for row in reader:
    j = 1
    counter+=1
    dic = {}
    row[i] = row[i].replace('"', '')
    dic[j] = row[i][:row[i].index(":")]
    j += 1
    dic[j] = row[i][row[i].index(":"):row[0].index(",")]
    j += 1
    rowdata = row[i][row[i].index(",")+1:]
    nreader = rowdata.split(",")
    for r in nreader:
        if ":" in r:
            n = r[r.index(":")+1:]
        else:
            n = None
        dic[j] = n
        j += 1
    list_d.append(dic)
jsonFileName='/home/bmi-introspect/OUTPUTJSON/jsonfile' + str(indexOfJsonfile)
file_wri = open(jsonFileName, 'w')
f = json.dump(list_d, file_wri)
file_wri.close()

