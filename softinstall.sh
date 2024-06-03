#!/bin/bash

## Functions

# Install software using apt/flatpak/snap
install(){
	if [ "$1" = 'apt' ]; then
		sudo apt install "$@"
	elif  [ "$1" = 'flatpak' ]; then
		flatpak install "$@"
	elif [ "$1" = 'snap' ]; then
		snap install "$@"
	else
		echo 'The install command needs a package manager'
		echo 'Syntax: softinstall install [apt/flatpak/snap] [package name]'
		exit 1
	fi
}

# Remove software using apt/flatpak/snap
remove(){
        if [ "$1" = 'apt' ]; then
                sudo remove install "$@"
        elif  [ "$1" = 'flatpak' ]; then
                flatpak uninstall "$@"
        elif [ "$1" = 'snap' ]; then
                snap remove "$@"
        else
                echo 'The install command needs a package manager'
                echo 'Syntax: softinstall install [apt/flatpak/snap] [package name]'
                exit 1
        fi
}

# Search packages from all sources
search(){
	echo
	echo '************* APT packages *************' && echo
	apt-cache search "$@"
	echo && echo '************* END APT packages *************' && echo
	echo && echo '************* Flatpak packages *************' && echo
	flatpak search "$@"
	echo && echo '************* END Flatpak packages *************' && echo
	echo && echo '************* Snap packages *************' && echo
	snap search "$@"
	echo && echo '************* END Snap packages *************' && echo
}

# Update system from all sources
update(){
        echo 'Updating apt and installing updates...' && sleep 1
        sudo apt update
        sudo apt dist-upgrade -y
        echo && echo 'Finished!' && echo && sleep 1
        clear
        echo 'Installing Flatpak updates...' && sleep 1
        flatpak update
        clear
        echo 'Updating Snaps...' && sleep 1
        snap refresh
	echo '********** System Updated **********'
	echo
}

# Run input
$@

exit $?
