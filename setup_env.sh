#!/bin/bash

# PROJECT
PROJECT_NAME='AsciiArt'
BUILD_MODE='Release'
PROVISIONING='XC:AdHocAsciiArt'
FL_CARTHAGE_PLATFORM="iOS"

# Fixed Env
XCODE_VER=""
if [ -e @{${WORKSPACE}/XCVERSION ]; then
XCODE_VER="$(cat ${WORKSPACE}/XCVERSION)"
fi
TARGET_XCODE=/Applications/Xcode${XCODE_VER}.app
DEVELOPER_DIR=${TARGET_XCODE}/Contents/Developer/
VERSION=` agvtool mvers -terse | grep -i ${PROJECT_NAME}/Info.plist | grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+'`
IPA_FILE=${WORKSPACE}/${PROJECT_NAME}-${VERSION}-${BUILD_NUMBER}.ipa
EXPORT_OPTIONS_PLIST="export_options.plist"
