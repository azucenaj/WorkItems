#! /bin/bash

echo " Enter process: 'put' or 'get'"
read ACTION

if [[ $ACTION == "get" ]] 
then
	scp -r demo@demo-VirtualBox:/home/demo/demo/ \Users\jonises.azucena\Desktop\VM
elif [[ $ACTION == "put" ]] 
then
	scp -r \Users\jonises.azucena\Desktop\VM demo@demo-VirtualBox:/home/demo/test
else
	echo "Please input valid action."
fi



