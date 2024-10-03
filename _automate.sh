#! /usr/bin/env bash

# Define the architecture types
ARCHITECTURES=("amd64" "arm64")

for ARCH in "${ARCHITECTURES[@]}"; do
    # Scan packages and generate the Packages file
    dpkg-scanpackages --arch "$ARCH" pool/main/ > "dists/stable/main/a/armangrewal007/binary-$ARCH/Packages"
    # Compress the Packages file
    gzip -9 < "dists/stable/main/a/armangrewal007/binary-$ARCH/Packages" > "dists/stable/main/a/armangrewal007/binary-$ARCH/Packages.gz"

    echo "Generated Package file for $ARCH architecture."
done

apt-ftparchive release dists/stable > dists/stable/Release
echo "Updated release too"
