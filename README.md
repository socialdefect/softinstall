# softinstall
Simple script for searching and updating packages from apt, flatpak and snap at once.
The install/remove functions might just as well be replaced by using the 
apt/flatpak/snap install/remove commands but might be useful for people who mix up 
search/find and remove/uninstall often. 

Usage:

softinstall [search/install/remove/update] [package name(s)]

Examples:
search: 
	softinstall search openshot
install: 
	softinstall install [apt/flatpak/snap] [package name(s)]

remove: 
	softinstall remove [apt/flatpak/snap] [package name(s)]

update:
	softinstall update





