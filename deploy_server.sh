#!/bin/sh
repository="https://github.com/gali1998/experiments-server.git"
base_path="/home/gali/"
dir_name = base_path + "experiments-server"

echo "killing existing service called nodeserver.service"...

if ! systemctl stop nodeserver.service; then
	echo "could not kill nodeserver.service"
else
	echo "successfully killed existing service"
fi

echo "The project: $repository will be cloned into $dir_name. if it exists it will be overridden"
if [ -d "$dir_name" ];then
	echo "removing folder..."
	if ! rm -Rf $dir_name; then
		echo "failed to remove directory $dir_name"
	else
		echo "directory removed successfully"
	fi
fi

echo "create empty directory $folder"

if ! mkdir $dir_name; then
	echo "failed to create directory $dir_name"
else
	echo "created directory $dir_name successfully"
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

if ! cd $dir_name; then
	echo "failed to enter $dir_name"
else
	echo "entered $dir_name"
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

if ! rm -Rf $folder/src; then
	echo "failed to remove src folder"
else
	echo "sucessfully removed src folder"
fi
echo "*** DONE! *** "
