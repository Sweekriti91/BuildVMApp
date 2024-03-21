#!/bin/bash

# Define the version (replace with actual version numbers)
version_xam_ios="16.4.0.23"
version_xam_android="13.2.2.0"
# version_mono="your_version_number"

# Using URls from https://github.com/actions/runner-images/blob/main/images/macos/scripts/helpers/xamarin-utils.sh
# Define the URL for the package
ios_pkg_url="https://dl.xamarin.com/MonoTouch/Mac/xamarin.ios-$version_xam_ios.pkg"
android_pkg_url="https://dl.xamarin.com/MonoforAndroid/Mac/xamarin.android-$version_xam_android.pkg"
# mono_pkg_url="https://dl.xamarin.com/MonoFrameworkMDK/Macx86/MonoFramework-MDK-$version_mono.macos10.xamarin.universal.pkg"

# # Download Mono package
# curl -O "$mono_pkg_url"
# # Install Mono package (you might need elevated privileges)
# sudo installer -pkg "MonoFramework-MDK-$version_mono.macos10.xamarin.universal.pkg" -target /

# Download iOS package
curl -O "$ios_pkg_url"
# Install iOS package (you might need elevated privileges)
sudo installer -pkg "xamarin.ios-$version_xam_ios.pkg" -target /

# Download Android package
curl -O "$android_pkg_url"
# Install Android package (you might need elevated privileges)
sudo installer -pkg "xamarin.android-$version_xam_android.pkg" -target /
