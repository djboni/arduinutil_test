echo "----------------------------------------------------------------------"

echo "Building tLinux"
cd tLinux/Debug

make all

echo "Running tLinux" 
mkdir -p test-reports
./tLinux.elf \
        --log_format=XML \
        --log_level=test_suite \
        --report_level=no \
        --log_sink=test-reports/report.xml

cd - >/dev/null

echo
echo
echo
