#!/bin/bash
branch=$1
path=$2
echo "create new script just to test push"
echo "                                         "
echo "*************************************"
echo "  changing directory"
echo "                                         "
echo "******************************************"
cd $path


IFS=', ' read -r -a array <<< "$branch"
for branchname in "${array[@]}"
do

echo "                                        "
echo "*************************************"
echo "********  fetching origin  *********"
git fetch origin

echo "                                         "
echo "*************************************"
echo "git checkout $branchname and git pull origin $branchname"

git checkout $branchname
git pull origin $branchname

echo "                                                      "

echo "                                                      "
echo "*************************************"
echo "	checking out master"
git checkout master
echo "                                                      "
echo "*************************************"
echo "	git pull origin master"
git pull origin master
echo "                                                      "
echo "**************************************"
echo "     merging  $branchname"


git merge $branchname
if [ $? -eq 0 ]; then

echo "******************************************************"
echo "	merge successful of  $branchname"
echo "******************************************************"
echo "                                                      "
echo "  starting git push origin master"
echo "                                                      "
echo "*******************************************************"

git push origin master




else
echo "*******************************************************"
echo "                                                      "
echo "	Merge Failed of  $branchname" 
echo "                                                      "
echo "*******************************************************"
echo "	Doing a reset to the main branch"
echo "                                                       "
git reset --merge
echo "                                                       "
echo "*******************************************************"

exit 1
fi

done
