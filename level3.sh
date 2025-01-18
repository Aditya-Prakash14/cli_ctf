#!/bin/bash

# Set the flag content
flag="SYNT=DF{Pelcg0_Z4fg3e_2024} Znffntr=gur gernfher"

# Encode the flag with ROT13
encoded_flag=$(echo "$flag" | tr 'A-Za-z' 'N-ZA-Mn-za-m')

# Create a root directory for the challenge
mkdir -p level3_ctf
cd level3_ctf

# Create a hidden directory
mkdir .hidden_area
chmod 755 .hidden_area
cd .hidden_area

# Create a file with an obfuscated flag - only base64 for simplicity
echo "$encoded_flag" > obfuscated_file1

# Create a decoy file
touch decoy1.txt
echo "Try using cat or find here." > decoy1.txt

# Create decoy directories
mkdir decoy_dir1
mkdir decoy_dir2
mkdir decoy_dir3

# Create decoy files in those directories
touch decoy_dir1/file1.txt
echo "This is just filler" > decoy_dir1/file1.txt
touch decoy_dir2/file2.txt
echo "Keep looking around!" > decoy_dir2/file2.txt
touch decoy_dir3/file3.txt
echo "The flag is not here!" > decoy_dir3/file3.txt

# Create a directory for the link
mkdir symlink_dir
cd symlink_dir

# Create a symbolic link to the obfuscated file - simpler relative path
ln -s ../obfuscated_file1 link_to_flag

# Create the decoding script, simple and direct
echo "#!/bin/bash" > decode_flag.sh
echo "cat link_to_flag | tr 'N-ZA-Mn-za-m' 'A-Za-z' " >> decode_flag.sh
chmod +x decode_flag.sh

cd ..
cd ..

# Create a binary file
dd if=/dev/urandom of=level3_ctf/binary.bin bs=1M count=2
echo "Hint: Follow the symlink." > level3_ctf/hint.txt
# Set an alias to auto-decode the flag file when accessed
echo "alias cat='function _cat_decode { if [[ \"\$1\" == \"level3_ctf/.hidden_area/symlink_dir/link_to_flag\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\" ; else command cat \"\$@\" ; fi; }; _cat_decode'" >> ~/.bashrc
source ~/.bashrc
# Set an alias for echo to output the correct flag format
echo "alias echo='function _echo_decode { if [[ \"\$1\" == \"level3_ctf/.hidden_area/symlink_dir/link_to_flag\" ]]; then tr \'N-ZA-Mn-za-m\' \'A-Za-z\' < \"\$1\"; else command echo \"\$@\" ; fi; }; _echo_decode'" >> ~/.bashrc
source ~/.bashrc
# Message to the user
echo "Level 3 Challenge Setup Complete!"
echo "This one should be a bit easier now, but there might be more files to explore!"
