#!/bin/bash

# Get the list of installed kernel images
installed_kernels=$(dpkg --list | grep linux-image | grep ii)

# Get the list of kernel modules
kernel_modules=$(find /lib/modules -maxdepth 1 -type d -execdir basename {} \; | grep -v "modules")

# Remove any kernel modules that are not in the list of installed kernel images
for module in $kernel_modules; do
  if [[ ! $installed_kernels =~ $module ]]; then
	mod_dir="/lib/modules/$module"
    echo "Removing $module at $mod_dir"
    #rm -rf $mod_dir
  fi
done
