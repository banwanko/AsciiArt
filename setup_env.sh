#!/bin/bash

# PROJECT
PROJECT_NAME='AsciiArt'
BUILD_MODE='Release'
PROVISIONING='XC:AdHocAsciiArt'

# Fixed Env
XCODE_VER=""
if [ -e @{${WORKSPACE}/XCVERSION ]; then
XCODE_VER="$(cat ${WORKSPACE}/XCVERSION)"
fi
TARGET_XCODE=/Applications/Xcode${XCODE_VER}.app
DEVELOPER_DIR=${TARGET_XCODE}/Contents/Developer/
VERSION=` agvtool mvers -terse | grep -i ${PROJECT_NAME}/Info.plist | grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+'`
IPA_DIR="${PROJECT_NAME}-${VERSION}-${BUILD_NUMBER}"
EXPORT_OPTIONS_PLIST="export_options.plist"
