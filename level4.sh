#!/bin/bash

# Set the flag content
flag="SYNT=DF{O1a4el_Ju1fc3e3e_2024} Zrffntr=uhag"

# Encode the flag with ROT13
encoded_flag=$(echo "$flag" | tr 'A-Za-z' 'N-ZA-Mn-za-m')

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
echo "$encoded_flag" > flag_file
chmod 444 flag_file

# Create the directory and script, with a direct command
mkdir script_dir
cd script_dir

echo "#!/bin/bash" > get_flag.sh
echo "cat ../flag_file | tr 'N-ZA-Mn-za-m' 'A-Za-z'" >> get_flag.sh
chmod +x get_flag.sh

cd ..
# Provide some initial setup info to the user
echo "Level 4 Challenge Started!"
echo "You need to execute the script to get the flag."
# Set an alias to auto-decode the flag file when accessed
echo "alias cat='function _cat_decode { if [[ \"\$1\" == \"level4_ctf/flag_file\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\" ; else command cat \"\$@\" ; fi; }; _cat_decode'" >> ~/.bashrc
source ~/.bashrc
# Set an alias for echo to output the correct flag format
echo "alias echo='function _echo_decode { if [[ \"\$1\" == \"level4_ctf/flag_file\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\"; else command echo \"\$@\" ; fi; }; _echo_decode'" >> ~/.bashrc
source ~/.bashrc
