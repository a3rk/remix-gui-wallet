set -x
echo "CI: Windows 10 x86_64"

echo "CI: Building static release..."
./build.sh
if [ $? -ne 0 ]; then
	echo "CI: Build failed with error code: $?"
	exit 1
fi

echo "CI: Building deployable binary..."
cd build
make deploy
if [ $? -ne 0 ]; then
	echo "CI: Build failed with error code: $?"
	exit 1
fi
cd ..

echo "CI: Creating release archive..."
RELEASE_NAME="remix-gui-win-64bit-$BUILD_VERSION"
cd build/release/bin/
mkdir $RELEASE_NAME
cp remixd.exe $RELEASE_NAME/
cp remix-wallet-gui.exe $RELEASE_NAME/
cp *.dll $RELEASE_NAME/
cp -R Qt* $RELEASE_NAME/
cp -R audio $RELEASE_NAME/
cp -R bearer $RELEASE_NAME/
cp -R iconengines $RELEASE_NAME/
cp -R imageformats $RELEASE_NAME/
cp -R mediaservice $RELEASE_NAME/
cp -R platforminputcontexts $RELEASE_NAME/
cp -R platforms $RELEASE_NAME/
cp -R playlistformats $RELEASE_NAME/
cp -R qmltooling $RELEASE_NAME/
cp -R styles $RELEASE_NAME/
cp -R translations $RELEASE_NAME/
cp ../../../ci/package-artifacts/CHANGELOG.txt $RELEASE_NAME/
cp ../../../ci/package-artifacts/README.txt $RELEASE_NAME/
"C:\Program Files\7-Zip\7z.exe" a  -r $RELEASE_NAME.zip -w $RELEASE_NAME
sha256sum $RELEASE_NAME.zip > $RELEASE_NAME.zip.sha256.txt