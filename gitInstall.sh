#!/bin/bash
url=$1
path=$2
mssg=$3
# checking whether git username is available or not
#---------------------------------------------------------------------------------------------
checkgitUseremail(){
    git config --global user.email 2>&1 >/dev/null # improvement by tripleee
GITUSERNAME_IS_AVAILABLE=$?
# ...
if [ $GITUSERNAME_IS_AVAILABLE -eq 0 ]; 
then
echo "email is $GITUSERNAME_IS_AVAILABLE"
else
echo "Please set your git email 
  useremail
 git config --global user.email $|useremail"
 fi
}


# checking whether git email is available or not
#---------------------------------------------------------------------------------------------
checkgitUsername(){
    git config --global user.name 2>&1 >/dev/null # improvement by tripleee
GITUSERNAME_IS_AVAILABLE=$?
# ...
if [ $GITUSERNAME_IS_AVAILABLE -eq 0 ]; 
then
echo "username is $GITUSERNAME_IS_AVAILABLE"
else
echo "Please enter your git username
  useremail
 git config --global user.name $|useremail"
 fi
}
sleep 3
checkgitUseremail
sleep 3
checkgitUsername
echo "                                         "
echo "*************************************"
echo "  changing directory"
echo "                                         "
echo "******************************************"
cd /home/ay/$path




echo "                                        "
echo "*************************************"
echo "********  Adding new repository *********"
git init
git remote add origin https://github.com/$url


if [ $? -eq 0 ]; then

echo "******************************************************"
echo "	add successful of  $url"
echo "******************************************************"
echo "                                                      "
echo "  starting git push origin master"
echo "                                                      "
echo "*******************************************************"

git add .
git commit -m "$mssg"

echo "                                         "
echo "*************************************"
echo "git remote add origin $url and git commit -m $mssg"

git push origin master




else
echo "*******************************************************"
echo "                                                      "
echo "	No url found of  $url" 
echo "                                                      "
echo "*******************************************************"
echo "	Doing a reset to the main branch"
echo "                                                       "
rm -rf .git
echo "                                                       "
echo "*******************************************************"

exit 1
fi


