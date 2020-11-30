#!/bin/sh
repository_name="experiments-server"
base_path="/home/gali/Desktop"
folder="$base_path/$repository_name"
repository="https://github.com/gali1998/experiments-server.git"

echo "killing existing process called $repository_name"...

if ! pm2 kill --name $repository_name; then
	echo "could not kill the existing process"
else
	echo "successfully killed existing process"
fi

echo "The project: $repository_name will be cloned into $folder. if it exists it will be overridden"
if [ -d "$folder" ];then
	echo "removing folder..."
	if ! rm -Rf $folder; then
		echo "failed to remove folder $folder"
	else
		echo "folder removed successfully"
	fi
fi

echo "create empty directory $folder"

if ! mkdir $folder; then
	echo "failed to create directory $folder"
else
	echo "created directory $folder successfully"
fi

if ! cd $base_path; then
	echo "failed to enter $folder"
else
	echo "entered $folder"
fi

echo "cloning $repolisotry..."

if ! git clone $repository; then
	echo "failed to clone $repository"
else
	echo "cloned sycessfully"
fi

if ! cd $folder; then
	echo "failed to enter $folder"
else
	echo "entered $folder"
fi

echo "installing node_modules...."

if ! npm install; then
	echo "failed to install node_modules"
else
	echo "successfully downloaded node_modules"
fi

echo "starting build..."

if ! npm run build; then
	echo "failed to build the app"
else
	echo "build succeeded"
fi

echo "installing pm2.."

if ! npm install pm2@latest -g; then 
	echo "failed to install pm2"
else
	echo "app started"
fi

echo "running app as a process"

if ! npm run start-prod; then
	echo "failed to run app as a process"
else
	echo "app is up!"
fi

echo "pruning dev dependencies..."

if ! npm prune; then
	echo "failed pruning dev dependencies"
else
	echo "successfully pruned dev dependencies"
fi

echo "removing src folder..."

if ! rm -Rf $folder/src; then
	echo "failed to remove src folder"
else
	echo "sucessfully removed src folder"
fi
