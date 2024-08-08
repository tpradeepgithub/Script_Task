#!/bin/bash
url="https://www.google.in"
response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)

echo "HTTP Response Code: $response_code"

if [ "$response_code" -eq 400 ]; then
	echo "Success: The request to $url was successful."
else
	echo "Failure: The request to $url failed with response code $response_code."
fi


# Task 2: Create a text file and replace "give" with "learning" from the 5th line till the end in lines containing "welcome"

# Create the text file
file_path="/home/pradeep/sample_file.txt"

cat <<EOL > $file_path
This is a sample text file.
It contains multiple lines of text.
Here we will perform some operations.
Welcome to the script.
We give you the best experience and welcome.
Make sure you give your best effort that welcomes us.
Learning is a continuous process.
We welcome all learners to give.
Never give up.
This is the end of the file.
EOL

echo "Sample file created at $file_path"

# Perform the replacement operation
awk 'NR<5 {print} NR>=5 && /welcome/ {gsub(/give/, "learning"); print} NR>=5 && !/welcome/ {print}' "$file_path" > temp_file && mv temp_file "$file_path"

echo "Replacement done in $file_path"
