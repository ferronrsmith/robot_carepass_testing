#!/bin/sh

# define a site-pacakge directory inside the current workspace
package=$WORKSPACE/.pyenv

# export site-package location as the PYTHONPATH
export PYTHONPATH=$package

# remove the site-package folder if it exists
if [ -d "$package" ]; then
    printf '%s\n' "Removing Packages ($package)"
    rm -rf "$package"
fi

# create the site-package folder
mkdir $package

# install robot framework dependencies inside the site-package dir
easy_install --install-dir=$package robotframework
easy_install --install-dir=$package decorator
easy_install --install-dir=$package robotframework-selenium2library
easy_install --install-dir=$package selenium
easy_install --install-dir=$package robotframework-requests
easy_install --install-dir=$package requests

# run the robot tests
$package/pybot -i prod_only tests/
