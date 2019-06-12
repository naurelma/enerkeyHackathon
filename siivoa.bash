#! /bin/bash




mkdir -p "tulos"
mv "Consumption_data/Grocery_electricity.csv" "Consumption_data/Grocery_electricity_main.csv" 
mv "Consumption_data/Grocery_electricity_submet.csv" "Consumption_data/Grocery_electricity_sub.csv"
# jaetaan data eri kansioihin
echo "Loop"
rm -r "tulos"
for file in $(ls Consumption_data/); do
	kohde="tulos/$file"
	mkdir -p $kohde
	#echo "$kohde"
	tail -n+2 Consumption_data/"$file" | cut -d";" -f3 | sort | uniq > $kohde/lista
	for id in $(cat $kohde/lista); do
		mkdir -p $kohde/$id
		#echo "$id"

		if [[ ! -f $kohde/$id/data.csv  ]]; then
			head -n1   Consumption_data/"$file" > $kohde/$id/data.csv
		fi
		grep "$id" Consumption_data/"$file" >> $kohde/$id/data.csv
		
	done
	rm $kohde/lista
done

#liitetään lisä tietoa dataan

#816
