#!/bin/bash

# Get the list of installed kernel images
installed_kernels=$(dpkg --list | grep linux-image)

# Get the list of kernel modules
kernel_modules=$(find /lib/modules -type d -maxdepth 1)

# Remove any kernel modules that are not in the list of installed kernel images
for module in $kernel_modules; do
  if [[ ! $installed_kernels =~ $module ]]; then
    echo "Removing $module"
    #rm -rf $module
  fi
done
