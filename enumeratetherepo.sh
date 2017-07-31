#this code requires you to have cloc installed.
# https://github.com/AlDanial/cloc



#make a temporary directory and change into it.  
#this is used to house the data without clogging up anything
mkdir ./tempdir
cd ./tempdir

# create a ./data directory 
mkdir ./data

#list the repositories here.  you can list as many as you like.  
#the repository that this code is based on is here for reference
git clone git@github.com:billyp/enumeratetherepo.git


#write the date the count was run
echo "Date" >> thecount.txt
date +"%Y-%m-%d" >> thecount.txt
echo "Time in UTC" >> thecount.txt
date +"%H%M" >> thecount.txt

#the business getting done
cloc ./. >> thecount.txt

#write the date of the count was run
echo "Date" >> thecount.txt
date +"%Y-%m-%d" >> thecount.txt
echo "Time in UTC" >> thecount.txt
date +"%H%M" >> thecount.txt

#output the file to show completion.
cat thecount.txt

#Move the file to someplace safer.
mv thecount.txt ../.

#prepare to clearnup
cd ..

#rename the file based on date
cat thecount.txt >> $(hostname -s)-$(date +"%Y%m%d-%H%M"-count).txt

#copy the file to the proper directory
#this will retain the folder of all valid data collected
cp $(hostname -s)-$(date +"%Y%m%d-%H%M"-count).txt ./data/$(hostname -s)-$(date +"%Y%m%d-%H%M"-count).txt

#clearn up old files
rm thecount.txt

#clean up the ./temp directory. This is needed to prepare for the next time the .sh file is run.
rm -rf ./tempdir


