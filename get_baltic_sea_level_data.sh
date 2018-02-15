#!/bin/bash

url_base="http://pegelonline.wsv.de/webservices/files/Wasserstand+Rohdaten"

# get all data
for station_name in OSTSEE/KIEL-HOLTENAU OSTSEE/LT+KIEL OSTSEE/GREIFSWALD-WIECK; do
    mkdir -p data/baltic_sea_level/${station_name}
    for m in {01..02}; do 
        for d in {01..31}; do 
            src_date_str="${d}.${m}.2018";
            dst_date_str="2018-${m}-${d}";
            curl \
            ${url_base}/${station_name}/${src_date_str}/down.txt \
            -o data/baltic_sea_level/${station_name}/${dst_date_str}.txt;
        done;
    done;
done;

# remove missing files (they contain error-404 HTML files)
find data/baltic_sea_level -type f -iname \*.txt -print0 | \
     xargs -0 -n1 -P1 -I {} \
         bash -c "grep -q html {} && rm -fv {};"

# convert to unix line endings
find data/baltic_sea_level -type f -iname \*.txt -print0 | \
     xargs -0 -n1 -P1 -I {} \
         bash -c "sed -i 's/.$//' {};"

# convert to unicode
find data/baltic_sea_level -type f -iname \*.txt -print0 | \
     xargs -0 -n1 -P1 -I {} \
         bash -c "iconv -f ISO-8859-15 -t UTF-8 {} > {}.cnv; mv {}.cnv {};"

# use spaces as separators
find data/baltic_sea_level -type f -iname \*.txt -print0 | \
     xargs -0 -n1 -P1 -I {} \
         bash -c "sed -i 's/#/ /' {}; sed -i 's/:/ /' {};"