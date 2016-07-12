echo "----------------------------------------------------------------------"

echo "Building tLinux"
cd tLinux/Debug

make all

mkdir -p test-reports
./tLinux.elf \
        --log_format=XML \
        --log_level=all \
        --report_level=short \
        --log_sink=test-reports/report.xml

# --log_level=all|success|test_suite|message|warning|error|cpp_exception|
#             system_error|fatal_error|nothing
# --report_level=no|confirm|short|detailed 



cd - >/dev/null

echo
echo
echo
