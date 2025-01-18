#!/bin/bash

# Set the flag content
flag="QS{Qu1ckSn4tch_Ch4mp10n_2024}"

# Create the main challenge directory
mkdir -p level5_ctf
cd level5_ctf

# Create a file with base64 encoded flag
echo "$(echo "$flag" | base64)" > encoded_flag
chmod 444 encoded_flag

# Provide some initial setup info to the user
echo "Level 5 Challenge Started!"
echo "The flag is encoded using a common encoding scheme. If you know the encoding, a specific command could assist in decoding it. Check your command line tools."