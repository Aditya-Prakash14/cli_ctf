#!/bin/bash

# Set the flag content
flag="QS{B3g1nn3r_Expl0r3r_2024}"

# Create a directory for the challenge
mkdir -p level1_ctf

# Create a hidden file named '-flag' inside the directory
touch level1_ctf/-
echo "$flag" > level1_ctf/-

# Create a dummy file 
touch level1_ctf/file1

echo "Challenge setup complete."
echo "The flag is hidden in a file named '-flag' inside the 'level1_ctf' directory. "
echo "Good luck finding it!"