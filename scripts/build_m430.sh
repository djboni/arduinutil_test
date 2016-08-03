echo "----------------------------------------------------------------------"

echo "Building m430"
cd m430/Debug

make clean
make all

cd - >/dev/null

echo
echo
echo
