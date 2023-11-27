#!/bin/bash

# Determine the directory of the script
script_dir="$(dirname "$(readlink -f "$0")")"

# Check the operating system
if [[ "$OSTYPE" == "darwin"* || "$OSTYPE" == "linux-gnu" ]]; then
    # macOS or Linux
    shebang="#!/usr/bin/env python3"
    wrapper="#!/bin/bash\nPYTHONPATH=\"$script_dir\" $script_dir/pogo.py \"\$@\""
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (MSYS or Cygwin)
    shebang=""
    wrapper="python $script_dir/pogo.py %*"
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

# Add shebang line to the Python script
echo -e "$shebang\n$(cat $script_dir/pogo.py)" > $script_dir/pogo.py

# Make the Python script executable
chmod +x $script_dir/pogo.py

# Create a wrapper script
echo -e "$wrapper" > $script_dir/pogo
chmod +x $script_dir/pogo

# Move the wrapper script to a directory in the system's PATH
mv $script_dir/pogo /usr/local/bin/

echo "Pogo has been setup!"

