#!/bin/bash

# This was made by a bash noob
# The comments are to remind me how I made it
# I'm half just making it to learn how to use bash

# These are for changing text color
REDTEXT='\033[0;31m'
GREENTEXT='\033[0;32m'
NOCOLORTEXT='\033[0m'

# Here are the dependencies
GIT_DEPS="git"
SDK_DEPS="cmake gcc-arm-none-eabi gcc g++"
# These are for advanced debugging, not installed by default
# OPENOCD_DEPS="gdb-multiarch automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev"
# I don't want VSCODE
# VSCODE_DEPS="wget"
UART_DEPS="minicom"

for PACKAGE_CATEGORY in GIT SDK UART
do
	# -e allows \n to print a new line
	echo -e "\n ---  $PACKAGE_CATEGORY Dependencies "
	# This creates a new variable name by adding _DEPS to the end
	PACKAGE_VARIABLE="${PACKAGE_CATEGORY}_DEPS"
	# The ! turns the string variable name into an actual variable
	for PACKAGE in ${!PACKAGE_VARIABLE}
	do
		OUTPUT_STRING="$PACKAGE"
		# ${#VARIABLE_NAME} gives string length
		while [ ${#OUTPUT_STRING} -lt 20 ];
		do
			# While string is too short, add a char to end
			OUTPUT_STRING="${OUTPUT_STRING}_"
		done
		# Now check if that package is installed
		if command -v "$PACKAGE" >/dev/null 2>&1;
		then
			printf "${NOCOLORTEXT}${OUTPUT_STRING}${GREENTEXT}[Installed]\n${NOCOLORTEXT}"
		else
			printf "${NOCOLORTEXT}${OUTPUT_STRING}${REDTEXT}[ Missing ]\n${NOCOLORTEXT}"
		fi
	done
done
# Ask if they would like to install these
echo Would you to install these packages? [Y/n
read INSTALL_ESSENTIAL
if [ "$INSTALL_ESSENTIAL" = "y" ] || [ "$INSTALL_ESSENTIAL" = "Y" ];
then
	INSTALL_ESSENTIAL=1
else
	INSTALL_ESSENTIAL=0
fi
if [ INSTALL_ESSENTIAL -eq 1 ];
then
		# Install things that aren't yet installed

# Ask user what they want to install
# echo
# echo The following are required for pico C++ development
# echo --- git Dependencies ---
# echo git
# echo --- SDK Dependencies ---
# echo cmake
# echo gcc-arm-none-eabi
# echo gcc
# echo g++
# echo --- OpenOCD Dependencies ---
# echo gdb-multiarch
# echo automake
# echo autoconf
# echo build-essential
# echo texinfo
# echo libtool
# echo libftdi-dev
# echo libusb-1.0-0-dev
# echo --- wget Dependencies ---
# echo wget
# echo --- UART Dependencies ---
# echo minicom
# echo


#
