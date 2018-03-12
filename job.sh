#!/bin/bash
echo "Please specify the path you want for vulnerability analysis"
read varnameList
i=0
for paths in $varnameList ; do
   i=$((i+1))
   #Checking if the given path is legit
   if [ -d "$paths" ]; then
      pathToCrawl=$paths
      echo "Crawling image on mountpoint =$pathToCrawl"
   else 
      echo "Incorrect path $i given for crawling, skipping to next path"
      break
   fi
   echo "-------------------------------------------------------"
   sudo python /home/bmi-introspect/agentless-system-crawler/crawler/crawler.py --features os,package --crawlmode MOUNTPOINT --mountpoint $pathToCrawl --url file://"/home/bmi-introspect/OUTPUT/test$i.csv" --logfile crawler.log
   echo "Converting CSV to JSON"
   echo "-------------------------------------------------------"
   `python /home/bmi-introspect/agentless-system-crawler/crawler/csv_to_json2.py "/home/bmi-introspect/OUTPUT/test$i.csv.0" $i`
   echo "Detecting Vulnerability"
   echo "-------------------------------------------------------"
   `python /home/bmi-introspect/agentless-system-crawler/crawler/VD.py "/home/bmi-introspect/OUTPUTJSON/jsonfile$i"`
done
