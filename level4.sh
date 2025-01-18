#!/bin/bash

# Set the flag content
flag="FLAG=QS{B1n4ry_Wh1sp3r3r_2024} Message=hunt"

# Create the main challenge directory
mkdir -p level4_ctf
cd level4_ctf

# Create decoy directories and files
mkdir decoy_dir1
mkdir decoy_dir2
touch decoy_dir1/file1.txt
echo "This file is not important" > decoy_dir1/file1.txt
touch decoy_dir2/file2.txt
echo "Look somewhere else!" > decoy_dir2/file2.txt

# Create a file with base64 encoded flag and readable permission
echo "$(echo "$flag" | base64)" > flag_file
chmod 444 flag_file

# Create the directory and script, with a direct command
mkdir script_dir
cd script_dir

echo "#!/bin/bash" > get_flag.sh
echo "cat ../flag_file | base64 -d" >> get_flag.sh
chmod +x get_flag.sh

cd ..

# Provide some initial setup info to the user
echo "Level 4 Challenge Started!"
echo "You need to execute the script to get the flag."