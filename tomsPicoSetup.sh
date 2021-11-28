#!/bin/bash

# This was made by a bash noob
# The comments are to remind me how I made it
# I'm half just making it to learn how to use bash

# These are for changing text color, colors are bold
T_RED='\033[1;31m'
T_GREEN='\033[1;32m'
T_YELLOW='\033[1;33m'
T_NOCOLOR='\033[0m'

# Here are the dependencies
GIT_DEPS="git"
SDK_DEPS="cmake gcc-arm-none-eabi gcc g++"
# openocd might be for advanced debugging, not installed by default
# OPENOCD_DEPS="gdb-multiarch automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev"
# I don't want vscode stuff
# VSCODE_DEPS="wget"
UART_DEPS="minicom"

MISSING_PACKAGES=""
for PACKAGE_CATEGORY in GIT SDK UART
do
	# -e allows \n to print a new line
	echo -e "\n --- $PACKAGE_CATEGORY Dependencies "
	# This creates a new variable name by adding _DEPS to the end
	PACKAGE_VARIABLE="${PACKAGE_CATEGORY}_DEPS"
	# The ! turns the string variable name into an actual variable
	for PACKAGE in ${!PACKAGE_VARIABLE}
	do
		OUTPUT_STRING="$PACKAGE"
		# ${#VARIABLE_NAME} gives string length
		while [ ${#OUTPUT_STRING} -lt 24 ];
		do
			# While string is too short, add a char to end
			OUTPUT_STRING="${OUTPUT_STRING}-"
		done
		# Now check if that package is installed
		if command -v "$PACKAGE" >/dev/null 2>&1;
		then
			printf "${OUTPUT_STRING}${T_GREEN}[Installed]\n${T_NOCOLOR}"
		else
			printf "${OUTPUT_STRING}${T_RED}[ Missing ]\n${T_NOCOLOR}"
			# If the missing packages variable is empty
			if [ ${#PACKAGE} -eq 0 ];
			then
					MISSING_PACKAGES="${PACKAGE}"
			else
					MISSING_PACKAGES="${MISSING_PACKAGES} ${PACKAGE}"
			fi
		fi
	done
done
# Ask if they would like to install these
printf "\nWould you to install missing packages? [Y/n] "
read USER_INPUT
printf "\n"
if [ "$USER_INPUT" = "y" ] || [ "$USER_INPUT" = "Y" ];
then
	INSTALL_APT_PACKAGES=1
else
	INSTALL_APT_PACKAGES=0
fi

# Now ask about the git stuff
if command -v "git" >/dev/null 2>&1;
then
	echo There are also git repos made by Raspberry that can be downloaded
	ESSENTIAL_REPOS="pico-sdk picotool"
	OPTIONAL_REPOS="pico-examples pico-playground pico-extras picoprobe"
	for REPO_TYPE in ESSENTIAL OPTIONAL
	do
		echo -e "\n --- $REPO_TYPE Repositories"
		REPO_VARIABLE="${REPO_TYPE}_REPOS"
		for REPO in ${!REPO_VARIABLE}
		do
			printf "${REPO}\n"
		done
	done
	# Ask until you get valid response
	# YOU WERE HERE YOU WERE HERE YOU WERE HERE YOU WERE HERE YOU WERE HERE YOU WERE HERE 
	printf "\nWhat would you like to do?\n[A = Install All / E = Install Essential / C = Choose Which To Install / N = Install None] "
	read USER_INPUT
else
	printf "\n${T_RED}WARNING - Git not installed so cannot install repos${T_NOCOLOR}\n"
fi

# Now install everything
# Install apt packages
if [ $INSTALL_APT_PACKAGES -eq 1 ];
then
	printf "${T_YELLOW} Installing packages with apt${T_NOCOLOR}\n"
	# Install things that aren't yet installed
	sudo apt update
	echo I should install $MISSING_PACKAGES
fi
# Install git repos
