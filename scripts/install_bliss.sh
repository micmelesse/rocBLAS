rm -rf blis
wget -O blis.tar.gz https://github.com/amd/blis/releases/download/2.0/aocl-blis-mt-ubuntu-2.0.tar.gz
tar -xvf blis.tar.gz
mv amd-blis-mt blis
rm blis.tar.gz
cd blis/lib
ln -s libblis-mt.so libblis.so
