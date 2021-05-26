#!/bin/sh
repository="https://github.com/gali1998/experiments-server.git"
base_path="/home/gali/"
directory_name="/home/gali/experiments-server"

echo $directory_name
echo "killing existing service called nodeserver.service"...

if ! systemctl stop nodeserver.service; then
	echo "could not kill nodeserver.service"
else
	echo "successfully killed existing service"
fi

echo "The project: $repository will be cloned into $directory_name. if it exists it will be overridden"
if [ -d $directory_name ];then
	echo "removing folder... $directory_name"
	if ! rm -Rf $directory_name; then
		echo "failed to remove directory $directory_name"
	else
		echo "directory removed successfully"
	fi
else
	echo "$directory_name not found"
fi

if ! cd $base_path; then
	echo "failed to enter $base_path"
else
	echo "entered $base_path"
fi

echo "cloning $repolisotry..."

if ! git clone $repository; then
	echo "failed to clone $repository"
else
	echo "cloned sycessfully"
fi

if ! cd $directory_name; then
	echo "failed to enter $directory_name"
else
	echo "entered $directory_name"
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

echo "enabling nodeserver.service"

if ! systemctl enable nodeserver.service; then
	echo "failed to enable nodeserver.service"
else
	echo "successfully enabled nodeserver.service"
fi

if ! systemctl start nodeserver.service; then
	echo "failed to start nodeserver.service"
else
	echo "successfully started nodeserver.service"
fi

if ! npm prune; then
	echo "failed pruning dev dependencies"
else
	echo "successfully pruned dev dependencies"
fi

echo "removing src folder..."

if ! rm -Rf $directory_name/src; then
	echo "failed to remove src folder"
else
	echo "sucessfully removed src folder"
fi
echo "*** DONE! *** "
