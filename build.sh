#!/bin/bash

. setup_env.sh

# ビルド番号振り直し
agvtool new-version -all ${BUILD_NUMBER}

# アーカイブ
xcodebuild clean archive -project ${PROJECT_NAME}.xcodeproj -target $TARGET -archivePath Archive
xcodebuild -exportArchive -exportFormat ipa -archivePath ./Archive.xcarchive -exportPath Sample.ipa -exportProvisioningProfile 'XC: com.example'

# IPA
xcodebuild -exportArchive -exportFormat IPA -archivePath ${WORKSPACE}/Archive.xcarchive -exportPath ${PROJECT_NAME}-${VERSION}.ipa -exportProvisioningProfile ${PROVISIONING}
