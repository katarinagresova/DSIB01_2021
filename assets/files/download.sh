#!/bin/bash
#TODO: add description

BASE_URL=https://www.encodeproject.org/files

#TODO: insert names of your files
FILES=(ENCFF959XKN)

mkdir data
cd data

for file in ${FILES[*]}
do
	# creating url of file
	url=$BASE_URL/$file/@@download/$file.fastq.gz
	echo File URL: $url

	#downloading file
	wget $url
	
	#unzip downloaded file. zipped version is automaticaly deleted.
	gunzip $file.fastq.gz
done

echo Downloaded files:
ls
