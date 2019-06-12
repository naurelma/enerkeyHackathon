#! /bin/bash


unzip OneDrive*
7z x Consumption_data.7z -o"Consumption_data" -aos
7z x Temperature.7z -o"Temperature" -aos

./script/siivoa.bash
./script/jaaxlsx.bash
./script/haetmp.bash