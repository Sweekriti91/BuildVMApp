#!/bin/bash

# Define the version (replace with your version numbers)
version_xam_ios="16.4.0.23"
version_xam_android="13.2.2.0"
# version_mono="your_version_number"

# Define the URL for the package
# Using URls from https://github.com/actions/runner-images/blob/main/images/macos/scripts/helpers/xamarin-utils.sh
ios_pkg_url="https://dl.xamarin.com/MonoTouch/Mac/xamarin.ios-$version_xam_ios.pkg"
android_pkg_url="https://dl.xamarin.com/MonoforAndroid/Mac/xamarin.android-$version_xam_android.pkg"
# mono_pkg_url="https://dl.xamarin.com/MonoFrameworkMDK/Macx86/MonoFramework-MDK-$version_mono.macos10.xamarin.universal.pkg"

download_with_retry() {
    url=$1
    download_path=$2

    if [ -z "$download_path" ]; then
        download_path="/tmp/$(basename "$url")"
    fi

    echo "Downloading package from $url to $download_path..." >&2

    interval=30
    download_start_time=$(date +%s)

    for ((retries=20; retries>0; retries--)); do
        attempt_start_time=$(date +%s)
        if http_code=$(curl -4sSLo "$download_path" "$url" -w '%{http_code}'); then
            attempt_seconds=$(($(date +%s) - attempt_start_time))
            if [ "$http_code" -eq 200 ]; then
                echo "Package downloaded in $attempt_seconds seconds" >&2
                break
            else
                echo "Received HTTP status code $http_code after $attempt_seconds seconds" >&2
            fi
        else
            attempt_seconds=$(($(date +%s) - attempt_start_time))
            echo "Package download failed in $attempt_seconds seconds" >&2
        fi

        if [ $retries -eq 0 ]; then
            total_seconds=$(($(date +%s) - download_start_time))
            echo "Package download failed after $total_seconds seconds" >&2
            exit 1
        fi

        echo "Waiting $interval seconds before retrying (retries left: $retries)..." >&2
        sleep $interval
    done

    echo "$download_path"
}


# # Download and Install Mono package
# More detailed install steps see https://github.com/actions/runner-images/blob/main/images/macos/scripts/helpers/xamarin-utils.sh#L28
# sudo installer -pkg "$(download_with_retry "$mono_pkg_url")" -target /

# Download and Install iOS package
sudo installer -pkg "$(download_with_retry "$ios_pkg_url")" -target /

# Download and Install Android package
sudo installer -pkg "$(download_with_retry "$android_pkg_url")" -target /


