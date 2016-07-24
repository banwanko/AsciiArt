#!/bin/bash

. setup_env.sh

# ビルド番号振り直し
agvtool new-version -all ${BUILD_NUMBER}

# アーカイブ
xcodebuild clean archive -project ${PROJECT_NAME}.xcodeproj -target $TARGET -archivePath Archive

# IPA
xcodebuild -exportArchive -exportFormat IPA -archivePath ${WORKSPACE}/Archive.xcarchive -exportPath MorningInHouse-${VERSION}.ipa -exportProvisioningProfile ${PROVISIONING}
