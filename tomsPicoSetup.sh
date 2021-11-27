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
# openocd might be for advanced debugging, not installed by default
# OPENOCD_DEPS="gdb-multiarch automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev"
# I don't want vscode stuff
# VSCODE_DEPS="wget"
UART_DEPS="minicom"

MISSING_PACKAGES=""
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
						OUTPUT_STRING="${OUTPUT_STRING}-"
				done
				# Now check if that package is installed
				if command -v "$PACKAGE" >/dev/null 2>&1;
				then
						printf "${NOCOLORTEXT}${OUTPUT_STRING}${GREENTEXT}[Installed]\n${NOCOLORTEXT}"
				else
						printf "${NOCOLORTEXT}${OUTPUT_STRING}${REDTEXT}[ Missing ]\n${NOCOLORTEXT}"
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
printf "\nWould you to install these packages? [Y/n] "
read USER_INPUT
printf "\n"
if [ "$USER_INPUT" = "y" ] || [ "$USER_INPUT" = "Y" ];
then
		INSTALL_ESSENTIAL=1
else
		INSTALL_ESSENTIAL=0
fi

# Now ask about the git stuff
echo There are also git repos made by Raspberry that can be downloaded
ESSENTIAL_REPOS="pico-sdk picoprobe picotool"
OPTIONAL_REPOS="pico-examples pico-playground pico-extras"
for

# Now install everything
# Install apt packages
if [ $INSTALL_ESSENTIAL -eq 1 ];
then
		# Install things that aren't yet installed
		echo $MISSING_PACKAGES
fi
# Install git repos
