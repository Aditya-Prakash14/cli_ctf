#!/bin/bash

# Set the flag content
flag="FLAG=QS{Qu1ckSn4tch_Ch4mp10n_2024} Massage=like a true"

# Create the main challenge directory
mkdir -p level5_ctf
cd level5_ctf

# Create a hidden directory
mkdir .secret_stuff
cd .secret_stuff

# Create decoy files
touch decoy1.txt
echo "This isn't the file you are looking for" > decoy1.txt
touch decoy2.txt
echo "Keep searching" > decoy2.txt


# Create the directory and flag file
mkdir data
cd data
echo "$(echo "$flag" | base64)" > encoded_flag
chmod 444 encoded_flag

# Create decoy files in the directory
touch decoy3.txt
echo "This might be important" > decoy3.txt
touch decoy4.txt
echo "Or maybe not?" > decoy4.txt

cd ..
cd ..
# Create a dummy file
dd if=/dev/urandom of=level5_ctf/dummy.bin bs=1M count=2

# Provide some initial setup info to the user
echo "Level 5 Challenge Started!"
echo "You need to explore thoroughly to find the encoded flag. Once you find it you will need to decode it using a specific command."