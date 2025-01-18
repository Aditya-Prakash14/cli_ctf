#!/bin/bash

# Set the flag content
flag="SYNT=DF{O3t1aa3e_Rkcy0e3e_2024} Znffntr=Obbz!"

# Encode the flag with ROT13
encoded_flag=$(echo "$flag" | tr 'A-Za-z' 'N-ZA-Mn-za-m')

# Create a directory for the challenge
mkdir -p level1_ctf

# Create a hidden file named '-' inside the directory and insert ROT13
echo "$encoded_flag" > level1_ctf/-

# Create a dummy file
touch level1_ctf/file1

# Set an alias to auto-decode the flag file when accessed
echo "alias cat='function _cat_decode { if [[ \"\$1\" == \"level1_ctf/-\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\"; else command cat \"\$@\" ; fi; }; _cat_decode'" >> ~/.bashrc
source ~/.bashrc
# Set an alias for echo to output the correct flag format
echo "alias echo='function _echo_decode { if [[ \"\$1\" == \"level1_ctf/-\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\"; else command echo \"\$@\" ; fi; }; _echo_decode'" >> ~/.bashrc
source ~/.bashrc
echo "Challenge setup complete."
echo "The flag is hidden in a file named '-' inside the 'level1_ctf' directory."
echo "Good luck finding it!"
