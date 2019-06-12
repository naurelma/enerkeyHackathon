#! /bin/bash

#oletus pwd sisältää muut

#pinta-ala, tmp, 
#
base=$PWD
gr="Grocery main and sub meters.xlsx"
of="Offices main meters.xlsx"

echo "$dir"

for kanta in $(ls tulos); do
	for id in $(ls tulos/$kanta); do
		if [[ $kanta =~ "Grocery" ]]; then
			use="$gr"
			csv="Grocery.csv"
		else 
			use="$of"
			csv="Offices.csv"
		fi
		rivi=$( egrep "^([^;]+;){8}$id;" csv/"$use"/"$kanta")
		enid=$( echo "$rivi" | cut -d";" -f2)
		realid=$( echo "$rivi" | cut -d";" -f3)				
		
		rivi1=$( egrep "^([^;]+;){3}$enid;" csv/"Hack facilities.xlsx"/$csv)
		area=$( echo "$rivi1" | cut -d";" -f5)
		station=$( echo "$rivi1" | cut -d";" -f6)
		
		cp Temperature/"$station"/temperature.csv tulos/"$kanta"/"$id" || (echo "<$id || $rivi || $rivi1 || $enid ; $realid ; $area ; $station>")

		echo 'facility;enid;realid;area;station' > tulos/"$kanta"/"$id"/tiedot
		echo "$id ; $enid ; $realid ; $area ; $station" >> tulos/"$kanta"/"$id"/tiedot
		( cd tulos/"$kanta"/"$id" ; Rscript --vanilla $base/script/yhdista.R ; rm temperature.csv) & 
	done
done

