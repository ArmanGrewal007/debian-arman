#! /usr/bin/env bash

# Author: Arman Grewal
#################################################
# Automate the process of creating Packages file
# Creating tgz of it, and a Release file
# ... run this after you change deb packages
#################################################

# Define the architecture types
ARCHITECTURES=("amd64" "arm64")

for ARCH in "${ARCHITECTURES[@]}"; do
    # Scan packages and generate the Packages file
    dpkg-scanpackages --arch "$ARCH" pool/main/ > "dists/stable/main/binary-$ARCH/Packages"
    # Compress the Packages file
    gzip -9 < "dists/stable/main/binary-$ARCH/Packages" > "dists/stable/main/binary-$ARCH/Packages.gz"

    echo "Generated Package file for $ARCH architecture."
done

apt-ftparchive release dists/stable > dists/stable/Release
echo "Updated release too"

############# Push to github #############
git config --global user.name "Arman Grewal"
git config --global user.email "armansinghrewal@gmail.com"

YELLOW_IT="\e[33;3m"
YELLOW_BOLD="\e[33;1m"
RESET="\e[0m"
echo -e "${YELLOW_BOLD}TIP:${RESET} ${YELLOW_IT}can abort this step using ctrl+z, then you can access the terminal${RESET}"
echo -e "${YELLOW_IT}you can run git diff, or anything you deem necessary${RESET}"
echo -e "${YELLOW_IT}further lines are just add, commit and push to git${RESET}"

read -p "Are you sure you want to add and commit? (y/n): " confirmation
if [[ "$confirmation" != "y" ]]; then
    echo "Operation canceled."
    exit 0
fi

# Commit to git
git add .
git commit -m "Updated release"
git push
