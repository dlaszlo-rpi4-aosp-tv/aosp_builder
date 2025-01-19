# AOSP Build Environment

This repository provides a pre-configured Docker image for setting up an Android Open Source Project (AOSP) build environment. The container includes all necessary tools and dependencies to streamline the AOSP build process.

## Usage

### Build the image
```
docker build --build-arg GIT_USERNAME="Your Name" --build-arg GIT_EMAIL="your.email@example.com" -t aosp-builder .
```

### Start the container
```
cd ~/path_to_your_build_directory
docker run --name aosp-builder --privileged --device /dev/loop-control -v .:/home/builduser -it aosp-builder
```

Note: The current directory (.) is mapped to /home/builduser inside the container. This allows you to manage your Android source code directly from the host system while the build runs in the container.

### Build Process

The build process is performed by the user within the pre-configured environment inside the container. All necessary build tools, libraries, and dependencies are already installed. You can directly start building AOSP from the /home/builduser directory inside the container.

