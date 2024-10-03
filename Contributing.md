## Notes for myself

1. Move your .deb files in pool/main/.
2. Use dpkg-scanpages to generate a Packages file, and convert it to zip for ease.
3. Use apt-ftparchive to create a Releases file
4. commit and go!

dpkg-scanpackages --arch amd64 pool/main/ > dists/stable/main/a/armangrewal007/binary-amd64/Packages <br>
cat dists/stable/main/a/armangrewal007/binary-amd64/Packages | gzip -9 > dists/stable/main/a/armangrewal007/binary-amd64/Packages.gz <br>

similar for arm64

apt-ftparchive release dists/stable > dists/stable/Release
