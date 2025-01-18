
#!/bin/bash

# Set the flag content
flag="flag5{md5_crypt0_h1dd3n_f1l3}"

# Create the main challenge directory
mkdir -p level5_ctf
cd level5_ctf

# Generate an MD5 hash of the flag
flag_md5=$(echo -n "$flag" | md5sum | cut -d' ' -f1)

# Create a hidden directory with a long random name
hidden_dir_name=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)
mkdir ".$hidden_dir_name"
cd ".$hidden_dir_name"

# Create a deeply nested directory structure
mkdir -p dir1/dir2/dir3/dir4/dir5/dir6/dir7

# Inside the deepest directory, create a file with md5 hash in the filename
touch dir1/dir2/dir3/dir4/dir5/dir6/dir7/"$flag_md5"

# Insert the flag into the file
echo "$flag" > dir1/dir2/dir3/dir4/dir5/dir6/dir7/"$flag_md5"

# Create a dummy file outside the hidden directory with random data
dd if=/dev/urandom of=dummy.bin bs=1M count=2

# Create a hint file
echo "The flag is not hidden in a text file. The flag file is not easily discoverable." > ../hint.txt
echo "Try using find to search for file types or names." >> ../hint.txt

# Add a shell script that will attempt to search for the flag
echo "#!/bin/bash" > ../search_for_flag.sh
echo "find . -type f -print0 | while IFS= read -r -d $'\0' file; do" >> ../search_for_flag.sh
echo "  if [[ \$(cat \$file | md5sum | cut -d' ' -f1) = "$flag_md5" ]]; then" >> ../search_for_flag.sh
echo "    cat \$file" >> ../search_for_flag.sh
echo "    exit 0" >> ../search_for_flag.sh
echo "  fi" >> ../search_for_flag.sh
echo "done" >> ../search_for_flag.sh
chmod +x ../search_for_flag.sh

# Set up another user
useradd -m level5user

# Change the ownership of the file to the level5user
chown -R level5user:level5user dir1/dir2/dir3/dir4/dir5/dir6/dir7

cd ../..

# Final message to the user
echo "Level 5 Challenge Started!"
echo "Good luck and be prepared to spend a lot of time!"