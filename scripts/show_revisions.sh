echo "----------------------------------------------------------------------"

echo "Workspace root"
git log -n1 --oneline HEAD
git submodule foreach \
        git log -n1 --oneline HEAD

echo
echo
echo
