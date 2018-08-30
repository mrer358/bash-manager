#!/usr/bin/bash
CreateFolder () {
	echo "\e[91m"
	echo "WARNING you need to type the full dirctory!!.."
	echo "exmple /root/TheFileNameHere"
        read -p "$(echo "type the full dirctory and name~>\e[96m")" NameFolder
	mkdir -p $NameFolder
	updatedb

	fdisk -l
	echo "\e[91m"
	read -p "$(echo "type the the disk you want to mount to the folder~>\e[96m")" TheDirctoryInfoToMount
 	eval mount  " $TheDirctoryInfoToMount" " $NameFolder"
	echo""
	echo "the process is finish"
	read -p "$(echo "do you want go back Y/N~>\e[96m")" YYYY
                        case "$YYYY" in
                        y)CheckDisks;;
                        n)exit;;
                        esac


}

MountNext () {
	echo "\e[91m"
	echo "WARNING you need to type the full dirctory!!.."
        echo "exmple /root/TheFileNameHere"
	echo "\e[91m"
        read -p "$(echo "type the full dirctory and name~>\e[96m")" MountNextInfoDirctory
	echo "\e[91m"	
	fdisk -l
	echo "\e[91m" 
	read -p "$(echo "type the full dirctory and name~>\e[96m")" ChoseOptionForMount
	eval   mount  " $ChoseOptionForMount " " $MountNextInfoDirctory" 
	echo "the process is finish"
	echo "\e[91m"
	read -p "$(echo "do you want go back Y/N~>\e[96m")" MMMM
                        case "$MMMM" in
                        y)CheckDisks;;
                        n)exit;;
                        esac

}








UpgradeSystem(){
        clear
        echo "                    \e[34mwelcome  to the software who make esay on you to manag  the system\e[32m"
	echo ""
	echo "for update the packets type 1."
	echo "for upgrade the system type 2."
	echo "for make a dist-upgrade type 3."
	echo "for install a packet type 4."
	echo "for go back type 5."
	echo "\e[91m"

        read -p "$(echo "type your option~>\e[96m")" UserUpdateOption 
	if [ $UserUpdateOption -eq 1 ]; then
		apt-get update
		echo ""
		echo "okay we finish the update, now we going back!.."
		sleep 3
		clear
		UpgradeSystem
		
	fi
	if  [ $UserUpdateOption -eq 2 ]; then
		apt-get upgrade
		echo ""
                echo "okay we finish the upgrade, now we going back!.."
                sleep 3
		clear
                UpgradeSystem
		
	fi		
	if  [ $UserUpdateOption -eq 3 ]; then
		apt-get dist-upgrade
		echo ""
                echo "okay we finish the dist-upgrade, now we going back!.."
                sleep 3
		clear
                UpgradeSystem

			
        fi
	if  [ $UserUpdateOption -eq 4 ]; then
		echo "\e[91m"

        	read -p "$(echo "type the name of the packet you want to install on the system~>\e[96m")" UserInstall
		echo "we searching if the packet exist..."
		sleep 2
		apt-get install $UserInstall
		echo ""
		echo "okay we finish, going back..."
		sleep 2
		clear
		UpgradeSystem
	
        fi
	if  [ $UserUpdateOption -eq 5 ]; then
		clear
		StartSoftware
        fi

}



searchfind(){
	 $COLOR="\e[96m"
        clear
        echo "                    \e[34mwelcome  to the software who make esay on you to manag  the system\e[32m"
        echo ""
        echo "for find a file type 1."
        echo "for find a link  type 2."
        echo "for find a som promisstions type 3."
        echo "for go back type 4."
        echo "\e[91m"

        read -p "$(echo "type your option~>\e[96m")" UserFind
	if [ $UserFind -eq "1" ]; then
		echo "\e[91m"
		read -p "$(echo "type the name of the file  you want to find~>\e[96m")" findFile 
		find  "/"  "-name"  "$findFile"
		
		echo ""
		echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yesno
                        case "$yesno" in
                        y)searchfind;;
                        n)exit;;
                        esac
	fi
	if [ $UserFind -eq  "2" ]; then
		echo "\e[91m"
                read -p "$(echo "type the name of the software you want to check ,which file connecting to this software~>\e[96m")" findLink
                find "/" -type l  |grep $findLink
                echo ""
		sleep 2
                echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yEEsno
                        case "$yEEsno" in
                        y)searchfind;;
                        n)exit;;
                        esac

	fi
	
	if [ $UserFind -eq  "3" ]; then
                echo "\e[91m"
		echo "which promission do you want to check?.."
		echo "0644,type.1"
		echo "0777,type.2"
		echo "if you like to insert you option, type.3"
                read -p "$(echo "type what do you wnat to continue~>\e[96m")" findPrems
                echo ""
		if [ $findPrems -eq "1" ]; then
			find "/" -perm 0664
			echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yeSSno
                        case "$yeSSno" in
                        y)searchfind;;
                        n)exit;;
                        esac
		
		fi
		if [ $findPrems -eq "2" ]; then 
			find "/" -perm 0777
			echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yeSRno
                        case "$yeSRno" in
                        y)searchfind;;
                        n)exit;;
                        esac

		fi
		if [ $findPrems -eq "3" ]; then
			echo "\e[91m"
			echo "for exmple 0777,0664, do not forget the zero!!"
			echo ""
			read -p "$(echo "please type the permission you want to search in all the system~>\e[96m")" findCommand
			find "/" -perm  $findCommand
			echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yeSNNo
                        case "$yeSNNo" in
                        y)searchfind;;
                        n)exit;;
                        esac

		
		fi

           

        fi

       

	if [ $UserFind -eq  "4" ]; then
		StartSoftware
	fi


}


CheckDisks(){
	clear
	echo "                    \e[34mwelcome  to the software who make esay on you to manag  the system\e[32m"
        echo ""
	echo "welcome to section of manag the hard disks in the system"
        echo ""
        echo "for see the all disks and the drivers in  the system type .1"
        echo "for mount a hard drive type .2"
        echo "for see the all mounts type .3"
        echo "for unmount a drive  type .4"
        echo "for format a hard disk type .5"
	echo "for change the mount dirctory type .6"
	echo "for go back  type .7"
	echo "\e[91m"

        read -p "$(echo "type your option~>\e[96m")" inputdisk
	if [ $inputdisk -eq "1" ]; then
		echo ""
		fdisk -l
		echo ""
		echo "\e[91m"

        	read -p "$(echo "do you want go back Y/N~>\e[96m")" YesOnInfo
		case "$YesOnInfo" in
                        y)CheckDisks;;
                        n)exit;;
                        esac 		
		
	fi 
	if [ $inputdisk -eq "2" ]; then
		echo "\e[91m"
	
		read -p "$(echo "do you want to create a folder  for your  new mount?Y/N~>\e[96m")" QuestionForCreateFolder
		case "$QuestionForCreateFolder" in
                        y)CreateFolder;;
                        n)MountNext;;
                        esac

				
	fi
	if [ $inputdisk -eq "3" ]; then 
		mount -l 
		echo "\e[91m"
		read -p "$(echo "do you want go back Y/N~>\e[96m")" YERsOnInfo
                case "$YERsOnInfo" in
                        y)CheckDisks;;
                        n)exit;;
                        esac

	fi 	
	if [ $inputdisk -eq  "4" ]; then 
		fdisk -l
		echo "\e[91m"
                read -p "$(echo "type the devise you want to umount~>\e[96m")" QusetionUnmount
		umount $QusetionUnmount
		echo "\e[91m"
		read -p "$(echo "do you want go back Y/N~>\e[96m")" WWWW
                        case "$WWWW" in
                        y)CheckDisks;;
                        n)exit;;
                        esac

	fi 
	if [ $inputdisk -eq "5" ]; then
		fdisk -l
                echo "\e[91m"
                read -p "$(echo "type the devise you want to format~>\e[96m")" QusetionForFormat
		mkfs.ext4 "$QusetionForFormat"
		echo "\e[91m"
		read -p "$(echo "do you want go back Y/N~>\e[96m")" ZZZZ
                        case "$ZZZZ" in
                        y)CheckDisks;;
                        n)exit;;
                        esac
	fi	
	if [ $inputdisk -eq "6" ]; then
		fdisk -l
                echo "\e[91m"
                read -p "$(echo "first type the devise id to  umount~>\e[96m")" QUsetionUnmount
                umount $QUsetionUnmount
		echo "\e[91m"
		echo "type the new dirctory!! "
		read -p "$(echo "type the full dirctory and name~>\e[96m")" MOuntNextInfoDirctory
        	echo "\e[91m"   
        
        	read -p "$(echo "type the full dirctory and name~>\e[96m")" CHoseOptionForMount
        	eval   mount  " $CHoseOptionForMount " " $MOuntNextInfoDirctory"
        	echo "the process is finish"
		read -p "$(echo "do you want go back Y/N~>\e[96m")" XXXX
                        case "$XXXX" in
                        y)CheckDisks;;
                        n)exit;;
                        esac


	fi
	if [ $inputdisk -eq "7" ]; then
		StartSoftware
	fi 
}

Brige ()  {
	clear
	usersandgroups




}


usersandgroups(){
	echo "                    \e[34mwelcome  to the software who make esay on you to manag  the system\e[32m"
	echo ""
	echo "welcome to section of manag users and groups"
	echo ""
	echo "for create a user with all plus password and dirctory type .1"
	echo "for create a simple only a shell type .2"
	echo "for create a group type .3"
	echo "for delete a group type .4"
	echo "for add users  to  groups type .5"
	echo "for delete a user type .6"
	echo "for check the list of users and groups type .7"
	echo "for go back  type .8"
	echo "\e[91m"

        read -p "$(echo "type your option~>\e[96m")" UserOptions
	if [ $UserOptions -eq "1" ]; then
		echo "\e[91m"

        	read -p "$(echo "type the user name you want to create~>\e[96m")" FullUser
		adduser $FullUser
		echo ""
		echo "we create a user:" $FullUser " enjoy!"
		sleep 2
		clear
		usersandgroups	
	
	fi	
	if [ $UserOptions -eq "2" ]; then   
		echo "\e[91m"

        	read -p "$(echo "type your option~>\e[96m")" Simpleuser
		echo "we create a user:" $Simpleuser " enjoy!"
		useradd $Simpleuser
        	sleep 2
		clear
		usersandgroups
	fi	
	if [ $UserOptions -eq "3" ]; then   
		echo "\e[91m"

        	read -p "$(echo "type the name of the group you want to create\e[96m")" CreateGroup
        	groupadd $CreateGroup
		echo "we create a group:" $CreateGroup " enjoy!"
		sleep 2 
		usersandgroups

	fi	
	if [ $UserOptions -eq "4" ]; then   
		echo "\e[91m"

        	read -p "$(echo "type your option~>\e[96m")" deleteingGroup
        	groupdel $deleteingGroup
		echo "we delete the group: " $deleteingGroup " enjoy!"
		sleep 2
		clear
		usersandgroups
		
	fi


	if [ $UserOptions -eq "5" ]; then   
		echo "\e[91m"

        	read -p "$(echo "type the name of user you want to add~>\e[96m")" userinfotoadd
		echo  ""
		echo "\e[91m"
        	read -p "$(echo "type the name of the group you want to add  the user~>\e[96m")" GroupToAdd
		useradd -G $GroupToAdd $userinfotoadd 
		echo "we are add the user to the group user "$userinfotoadd "to group"$GroupToAll
		sleep 2
		clear
		usersandgroups
		

	fi
	
	if [ $UserOptions -eq "6" ]; then   
		echo "\e[91m"
        	read -p "$(echo "type your option~>\e[96m")" DeleteUser
        	userdel $DeleteUser
	fi
	
	if [ $UserOptions -eq "7" ]; then   
		echo "for check users type .1"
                echo "for check the groups type .2"
                	
		echo "\e[91m"
		read -p "$(echo "chose what you want to check~>\e[96m")" OPtion
       		if [ $OPtion -eq  "1" ]; then
			
			cat /etc/passwd
			echo "\e[91m"
			read -p "$(echo "do you want go back Y/N~>\e[96m")" yesno
			case "$yesno" in
			y)Brige;;
			n)exit;;
			esac
			
		fi
	
		if [ $OPtion -eq  "2" ]; then
			cat /etc/group
			echo "\e[91m"
                        read -p "$(echo "do you want go back Y/N~>\e[96m")" yesnO
			case $yesnO in
			y)Brige;;
			n)exit;;
			esac
			
	
		fi
	fi
	
	if [ $UserOptions -eq "8" ]; then   
		clear
		StartSoftware
        
	fi


	
		

}



StartSoftware (){
	if [ $(id -u) -ne 0 ]; then
         echo "\e[91mPlease run as root"

  else

	clear
	echo "                    \e[34mwelcome  to the software who make esay on you to manag  the system\e[32m"
	echo ""
	echo "for manag the users and groups type .1"
	echo "for manag the dicks in the system type .2"
	echo "for find  file and more  options for search files type .3"
	echo "for update  the system and upgrade type .4"
	echo "for exit type .5"
	echo "\e[91m"

	read -p "$(echo "type your option~>\e[96m")" valueoption
	echo "\e[96m"	
	if [ $valueoption -eq "1" ]; then
		clear
		usersandgroups
	fi
	if [ $valueoption -eq "2" ]; then 
		clear
		CheckDisks
	fi 
	
	if [ $valueoption -eq "3" ]; then 
		clear
		searchfind
	fi	
	if [ $valueoption -eq "4" ]; then
		clear
		UpgradeSystem
	fi
	if [ $valueoption -eq "5" ]; then
		clear
		$EXIT

	else 
		echo "sorry we  do not hava this option, starting to go back!.."
		sleep 3
		StartSoftware		


		
	fi
fi

}
StartSoftware
