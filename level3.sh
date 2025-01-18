#!/bin/bash

# Set the flag content
flag="QS{Crypt0_M4st3r_2024}"

# Create a root directory for the challenge
mkdir -p level3_ctf
cd level3_ctf

# Create a hidden directory
mkdir .hidden_area
cd .hidden_area

# Create a file with an obfuscated flag - only base64 for simplicity
echo "$(echo "$flag" | base64)" > obfuscated_file1

# Create a decoy file
touch decoy1.txt
echo "Try using cat or find here." > decoy1.txt

# Create a directory for the link
mkdir symlink_dir
cd symlink_dir

# Create a symbolic link to the obfuscated file - simpler relative path
ln -s ../obfuscated_file1 link_to_flag

# Create the decoding script, simple and direct
echo "#!/bin/bash" > decode_flag.sh
echo "cat link_to_flag | base64 -d" >> decode_flag.sh
chmod +x decode_flag.sh

cd ..
cd ..


# Create a binary file
dd if=/dev/urandom of=level3_ctf/binary.bin bs=1M count=2
echo "Hint: Follow the symlink." > level3_ctf/hint.txt

# Message to the user
echo "Level 3 Challenge Setup Complete!"
echo "This one should be a bit easier now!"