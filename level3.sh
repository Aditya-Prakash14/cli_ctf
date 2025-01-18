#!/bin/bash

# Set the flag content
flag="flag3{m0r3_0bscur1ty_m0r3_t1m3}"

# Create a root directory for the challenge
mkdir -p level3_ctf
cd level3_ctf

# Create a hidden directory
mkdir .hidden_area
cd .hidden_area

# Create a file with an obfuscated flag
echo "VGhpcyBpcyBzb21lIHRleHQuLi4=" > obfuscated_file1
echo "SGVyZSBpcyBzb21lIG1vcmUgdGV4dC4uLi4=" >> obfuscated_file1
echo "$(echo "$flag" | base64 | tr 'a-z' 'n-za-m')" >> obfuscated_file1 # base64 and ROT13
echo "QW5kIHRoaXMganVzdCBzb21lIG1vcmUgdGV4dA==" >> obfuscated_file1

# Create a decoy file
touch decoy1.txt
echo "Try using cat or find here." > decoy1.txt

# Create a directory with a special name and permissions - changed permission
mkdir --mode=755 special_dir
cd special_dir

# Create a symbolic link to the obfuscated file - changed relative link
ln -s ../obfuscated_file1 link_to_flag

# Changed script to be in the special dir, also changed the command to be a relative path to the ln
echo "#!/bin/bash" > decode_flag.sh
echo "cat link_to_flag | tr 'n-za-m' 'a-z' | base64 -d" >> decode_flag.sh
chmod +x decode_flag.sh

cd ..
cd ..

# Create a binary file
dd if=/dev/urandom of=level3_ctf/binary.bin bs=1M count=2
echo "Hint: You may want to follow the symlink and use a script to get the flag." > level3_ctf/hint.txt

# Message to the user
echo "Level 3 Challenge Setup Complete!"
echo "Good luck. You'll need to take your time and explore carefully."