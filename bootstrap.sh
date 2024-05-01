#! /bin/sh
echo "Bootstrapping panyyamonium dotfiles"

# Just a function for checking if nushell is installed
is_nu_installed() {
	if [[ -x "$(command -v nu)" ]]; then
		true
	else
		false
	fi
}

# Detect the operating system for automatic installing 

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "LinuxGnu OS detected"
	
	# Check if the user has nushell installed?
	if ! is_nu_installed ; then
		echo "Need to install nushell"

		# Depending on the package manager available 
		# install nushell 

		# Pacman
		if [[ -x "$(command -v pacman)" ]]; then
			echo "Installing via pacman"
			sudo pacman -S --noconfirm --needed nushell

		# Unknown
		else 
			echo "Couldn't find a package manager"
			exit -1
		fi

	# Already have nushell installed :) Yippie!
	else
		echo "Nushell is already installed"
	fi

# Mac OSX, I have no idea 
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Detected macos, I can't help you here"
	exit -1

# Unkown OS damn, fail
else 
	echo "\"$OSTYPE\" is an unknown value for OSTYPE"
	exit -1
fi