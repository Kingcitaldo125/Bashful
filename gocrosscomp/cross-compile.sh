#!/bin/bash

APP_NAME=""

# Define the platforms and architectures
declare -a PLATFORMS=(
    "linux/amd64"
    "linux/arm64"
    "darwin/arm64"
    "windows/amd64"
)

# Create a builds directory
mkdir -p builds

for platform in "${PLATFORMS[@]}"
do
    platform_split=(${platform//\// })
    GOOS=${platform_split[0]}
    GOARCH=${platform_split[1]}
    
    output_name="builds/$APP_NAME-$GOOS-$GOARCH"
    echo "Building $output_name"
    
    # Add .exe extension for Windows
    if [ $GOOS = "windows" ]; then
        output_name+='.exe'
    fi
    
    echo "Building for $GOOS/$GOARCH..."
    
    env GOOS=$GOOS GOARCH=$GOARCH go build -o $output_name .
    
    if [ $? -ne 0 ]; then
        exit 1
    fi
done

exit 0
