#!/bin/bash

echo ---

# To check if firefox is installed
if command -v firefox >/dev/null 2>&1;
then
	echo Firefox is installed
else
	echo Firefox is not installed
fi

echo ---

# To check if kate is installed
if command -v kate >/dev/null 2>&1;
then
	echo Kate is installed
else
	echo Kate is not installed
fi

echo ---
