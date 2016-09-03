#!/bin/bash

# PROJECT
export PROJECT_NAME='AsciiArt'
export BUILD_MODE='Release'
export PROVISIONING='XC:AdHocAsciiArt'

# Fixed Env
export XCODE_VER=""
if [ -e @{${WORKSPACE}/XCVERSION ]; then
export XCODE_VER="$(cat ${WORKSPACE}/XCVERSION)"
fi
export TARGET_XCODE=/Applications/Xcode${XCODE_VER}.app
export DEVELOPER_DIR=${TARGET_XCODE}/Contents/Developer/
export VERSION=` agvtool mvers -terse | grep -i ${PROJECT_NAME}/Info.plist | grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+'`
export IPA_FILE=${WORKSPACE}/${PROJECT_NAME}-${VERSION}-${BUILD_NUMBER}.ipa
export EXPORT_OPTIONS_PLIST="export_options.plist"
