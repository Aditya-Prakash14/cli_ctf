#!/bin/bash

# Set the flag content
flag="flag3{th1s_1s_4_t1m3_c0n5um1ng_ch4ll3ng3}"

# Create a root directory for the challenge
mkdir -p level3_ctf
cd level3_ctf

# Create a hidden directory
mkdir .hidden_area
cd .hidden_area

# Create a file with an obfuscated flag
echo "VGhpcyBpcyBzb21lIHRleHQuLi4=" > obfuscated_file1
echo "SGVyZSBpcyBzb21lIG1vcmUgdGV4dC4uLi4=" >> obfuscated_file1
echo "$(echo "$flag" | base64)" >> obfuscated_file1
echo "QW5kIHRoaXMgaXMganVzdCBzb21lIG1vcmUgdGV4dA==" >> obfuscated_file1

# Create a decoy file
touch decoy1.txt
echo "Try using cat or find here." > decoy1.txt

# Create a directory with write permissions but no read
mkdir --mode=730 not_readable_dir
cd not_readable_dir

# Create a symbolic link in the directory that links to the flag file
ln -s ../obfuscated_file1 link_to_obfuscated

cd ..
cd ..
# Create a binary file
dd if=/dev/urandom of=level3_ctf/binary.bin bs=1M count=2
echo "Hint: It seems like the files may be stored in a different place. Try to find a file that might link to the flag file." > level3_ctf/hint.txt

# Message to the user
echo "Level 3 Challenge Setup Complete!"
echo "Good luck. You'll need it."