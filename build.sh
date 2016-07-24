#!/bin/bash

. setup_env.sh

# ビルド番号セット
agvtool new-version -all ${BUILD_NUMBER}

# アーカイブ
xcodebuild clean
xcodebuild -project ${PROJECT_NAME}.xcodeproj -configuration ${BUILD_MODE}

# IPA
xcrun -sdk iphoneos PackageApplication build/Release-iphoneos/${PROJECT_NAME}.app \
  -o ${WORKSPACE}/${IPA_DIR}.ipa
  