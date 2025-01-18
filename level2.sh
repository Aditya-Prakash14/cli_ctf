#!/bin/bash

# Set the flag content
flag="SYNT=DF{A3gj0ex_A1aw4_2024} Znffntr=Lbh’ir penpxrq"

# Encode the flag with ROT13
encoded_flag=$(echo "$flag" | tr 'A-Za-z' 'N-ZA-Mn-za-m')

# Create a directory for the challenge
mkdir -p level2_ctf

# Create a hidden directory
mkdir -p level2_ctf/.secret

# Create a file with a confusing name inside the hidden directory
echo "$encoded_flag" > level2_ctf/.secret/file-with-hyphens

# Create a dummy file outside of the secret directory
touch level2_ctf/file1

# Create a file that shows the files
echo "ls -al" > level2_ctf/showFiles
chmod +x level2_ctf/showFiles

# Set an alias to auto-decode the flag file when accessed
echo "alias cat='function _cat_decode { if [[ \"\$1\" == \"level2_ctf/.secret/file-with-hyphens\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\" ; else command cat \"\$@\" ; fi; }; _cat_decode'" >> ~/.bashrc
source ~/.bashrc
# Set an alias for echo to output the correct flag format
echo "alias echo='function _echo_decode { if [[ \"\$1\" == \"level2_ctf/.secret/file-with-hyphens\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\"; else command echo \"\$@\" ; fi; }; _echo_decode'" >> ~/.bashrc
source ~/.bashrc

# Inform the user about the challenge
echo "Level 2 Challenge Setup Complete!"
echo "A flag is hidden within the level2_ctf directory."
echo "Good luck hunting!"
