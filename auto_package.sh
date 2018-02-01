#!/bin/sh
# This script use xcodebuild tool to build a Xcode workspace, and upload the ipa file to fir(https://fir.im/)

# clean the workspace
xcodebuild clean -workspace  yourWorkSpaceName.xcworkspace -scheme yourSchemeName -configuration Release &&

# archive your project, the same as you click the Xcode menu： Product -> Archive
xcodebuild archive -workspace yourWorkSpaceName.xcworkspace -scheme yourWorkSpaceName -configuration Release -archivePath "./yourCustomArchivefileName.xcarchive" &&

# export as .ipa file, XXXXXXXXXX.plist is your export configuration file, you should point out your teamID, export type and so on there.
xcodebuild -exportArchive -archivePath "./yourCustomArchivefileName.xcarchive" -exportPath "./yourExportDirectory" -exportOptionsPlist "XXXXXXXXXX.plist" &&

# upload the ipa file to fir, you can see the usage of fir command here: https://github.com/FIRHQ/fir-cli
fir publish ./yourExportDirectory/yourCustomArchivefileName.ipa -T "XXXXXXXXXXXXXXXX"
