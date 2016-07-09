echo "----------------------------------------------------------------------"

echo "Workspace root"
git rev-parse --verify HEAD;
git submodule foreach \
        git rev-parse --verify HEAD

echo
echo
echo
