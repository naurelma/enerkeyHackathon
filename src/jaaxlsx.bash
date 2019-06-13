#! /bin/bash

mkdir -p csv uudet
rm -r csv
for file in *xlsx; do
	echo "$file"
	xlsx2csv -d";" -a -i "$file" | csplit --digits=2  --quiet --prefix=uudet/ - "/--------/-0" "{*}"
	rm uudet/00
	mkdir -p csv/"$file"
	for i in $(ls uudet); do
		nimi=$(head -n1 uudet/"$i" | cut -d" " -f4)
		echo "	$nimi"
		tail -n+2 uudet/"$i"| sed -f $SCRIPTIT/muutokset.sed > csv/"$file"/"$nimi".csv
		rm uudet/"$i"
	done
done
rmdir uudet
