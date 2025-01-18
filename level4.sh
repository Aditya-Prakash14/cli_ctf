#!/bin/bash

# Set the flag content
flag="flag4{34sy_pr1v_3sc}"

# Create the main challenge directory
mkdir -p level4_ctf
cd level4_ctf

# Create a file with base64 encoded flag and restricted permission
echo "$(echo "$flag" | base64)" > flag_file
chmod 400 flag_file

# Create a directory for the privileged user's script
mkdir privileged_script
cd privileged_script


# Create a program that will run as another user
echo "#!/bin/bash" > get_flag.sh
echo "sudo -u level4user cat ../flag_file | base64 -d" >> get_flag.sh
chmod +x get_flag.sh


cd ..
# Create a user for use in this challenge.
useradd -m level4user

# Provide some initial setup info to the user
echo "Level 4 Challenge Started!"
echo "You need to use a privileged user to get the flag."