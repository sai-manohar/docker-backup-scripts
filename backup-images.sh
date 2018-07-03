for i in `docker ps -q`
        do 
	containerID=$i	
	container_name=`timeout 3 docker inspect --format='{{.Name}}' "$containerID"`
	# If Container name is not null then we need to proceed otherwise  stop.
	if [ ! -z "$container_name" -a "$container_name" != " " -a "$container_name" = "/ci-cd" ]; then
#	if [ ! -z "$container_name" -a "$container_name" != " "  ]; then
		echo "Committing docker.."
		echo ""	        
	        mod_container_name=$(echo $container_name | cut -c 2-)	        
	        #docker commit $containerID $mod_container_name:latest
        	echo -n "$container_name - "
	        container_image=`docker inspect --format='{{.Config.Image}}' $container_name`
		echo "$container_image"
	        mkdir -p $backup_path/$container_name
	        save_file="$backup_path$container_name$container_name-image.tar"
		save_folder="$backup_path$container_name"
		echo "$save_file"
	        docker save -o $save_file $container_image
	        echo "OK"
		# change permissions of the fiel tar file
		echo -n  "Changing permissions of the backup created.."
		# change permissions of the tar file
		echo -n  "Changing permissions of the backup created.."
		echo ""
		chmod 755 "$save_file"
		echo -n "Copying the backup to remote location.. Please be patient!"		
		echo ""
		scp -i ~/.ssh/id_rsa -rp $save_folder $target_path
		echo ""	
		echo -n "Copied successfully!"
		echo ""
		echo -n "Removing the image created in the docker server."
		echo ""
		# remove local image,e
	        # uploaded well before deleting
        	rm -f $save_file
		echo -n "$container_image"  - Done
		echo ""
		echo ""
	        # create a container that does md5
	        #md5sum $save_file $save_file.md5
	        #echo "md5"
	fi
done
