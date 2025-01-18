
#!/bin/bash

# Set the flag content
flag="flag4{m4ny_l4y3rs_0f_0bfusc4tion}"

# Create the main challenge directory
mkdir -p level4_ctf
cd level4_ctf

# Create a hidden directory structure
mkdir .secret_area
cd .secret_area
mkdir .vault
cd .vault

# Create a protected file with base64 and ROT13 encoded flag
echo "$(echo "$flag" | base64 | tr 'A-Za-z' 'N-ZA-Mn-za-m')" > encoded_flag
chmod 400 encoded_flag # make it read only for owner

# Create a decoy file in the vault with a false clue
echo "This is a decoy file with some text" > decoy.txt
cd ../..

# Create a directory that requires special access (only for the group)
mkdir -p restricted_zone
chmod 710 restricted_zone #read and execute for owner, execute only for group

# Inside the restricted area, create a file that has a password in it to an account
echo "password_to_a_user:password123" > restricted_zone/user_password.txt

# Create a program that will run a shell script as another user
echo "#!/bin/bash" > run_as_user.sh
echo "sudo -u level4user /tmp/get_flag.sh" >> run_as_user.sh
chmod +x run_as_user.sh

# Create the script that level4user will use to extract the flag.
echo "#!/bin/bash" > /tmp/get_flag.sh
echo "find . -name encoded_flag -exec cat {} \; | tr 'N-ZA-Mn-za-m' 'A-Za-z' | base64 -d" >> /tmp/get_flag.sh
chmod +x /tmp/get_flag.sh
# Create a user that is only for use in this challenge.
useradd -m level4user

# Provide some initial setup info to the user
echo "Level 4 Challenge Started! This will take some time and lots of searching!"
echo "Try to look everywhere, the flag could be anywhere!"