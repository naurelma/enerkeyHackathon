#! /bin/bash


mkdir -p valmis
header="Timestamp;MeterId;EnegiaId;TreeId;NodeId;Value;Temperature;Area;City;Postcode"

for kanta in $(ls tulos); do
	echo $header > valmis/"$kanta"
	for id in $(ls tulos/$kanta); do
		dir=tulos/"$kanta"/"$id"

		lisa=$(tail -n1 "$dir"/tiedot.csv | cut -d";" -f 4,6,7 )
		tail -n+2 "$dir"/yhdistetty.csv | sed "s/$/;$lisa/" >> valmis/"$kanta"
	done
done