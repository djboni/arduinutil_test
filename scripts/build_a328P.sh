echo "----------------------------------------------------------------------"

echo "Building a328P"
cd a328P/Debug

make clean
make all

cd - >/dev/null

echo
echo
echo
