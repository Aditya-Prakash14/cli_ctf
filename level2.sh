#!/bin/bash

# Set the flag content
flag="QS{N3tw0rk_N1nj4_2024}"

# Create a directory for the challenge
mkdir -p level2_ctf

# Create a hidden directory
mkdir level2_ctf/.secret

# Create a file with a confusing name inside the hidden directory
touch level2_ctf/.secret/file-with-hyphens

# Create a file with a special character in it
echo "this is some junk" > level2_ctf/.secret/file-with-hyphens
echo "$flag" >> level2_ctf/.secret/file-with-hyphens
echo "this is more junk" >> level2_ctf/.secret/file-with-hyphens

# Create a fake file outside of the secret directory
touch level2_ctf/file1
echo "This file has nothing interesting. Look somewhere else." > level2_ctf/file1

level 2
# Create a file that shows the files
echo "ls -al" > level2_ctf/showFiles
chmod +x level2_ctf/showFiles

# Inform the user about the challenge
echo "Level 2 Challenge Setup Complete!"
echo "A flag is hidden within the level2_ctf directory."
echo "Good luck hunting!"