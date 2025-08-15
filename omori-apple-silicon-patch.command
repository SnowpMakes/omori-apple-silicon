#!/bin/sh

echo ""
echo "/-------------------------------------------\\"
echo "|     - OMORI APPLE SILICON PATCH TOOL -    |"
echo "|             by Snowp and ynx0             |"
echo "|                                           |"
echo "| github.com/SnowpMakes/omori-apple-silicon |"
echo "|             https://snowp.io              |"
echo "\\-------------------------------------------/"
echo ""

OMORI=~/Library/Application\ Support/Steam/steamapps/common/OMORI

if [ ! -d "${OMORI}" ] || [ ! -d "${OMORI}/OMORI.app" ]; then
  echo "[!!] Please install OMORI using Steam before using this tool.";
  exit 1;
fi;

echo "Backing up original OMORI copy.."
if [ -f "${OMORI}/OMORI.original.app" ]; then
  rm -rf "${OMORI}/OMORI.original.app"
fi;
cp -r "${OMORI}/OMORI.app" "${OMORI}/OMORI.original.app";

TMPFOLDER=`mktemp -d /tmp/omori-patch.XXXXXX` || exit 1
cd $TMPFOLDER;

mv "${OMORI}/OMORI.app" "./OMORI.original.app";

echo "Downloading nwjs.."
curl -#L -o nwjs.zip https://dl.nwjs.io/v0.102.1/nwjs-v0.102.1-osx-arm64.zip
echo "Downloading node polyfill patch.."
curl -#L -o node-polyfill-patch.js https://github.com/SnowpMakes/omori-apple-silicon/releases/download/v1.1.0/node-polyfill-patch.js
echo "Downloading greenworks patches.."
curl -#L -o greenworks.js https://github.com/SnowpMakes/omori-apple-silicon/releases/download/v1.1.0/greenworks.js
curl -#L -o greenworks-osxarm64.node https://github.com/SnowpMakes/greenworks-arm64/releases/download/v1.0.0/greenworks-osxarm64.node
echo "Downloading steamworks api.."
curl -# -o steam.zip https://dl.snowp.io/omori-apple-silicon/steam.zip

echo "Extracting nwjs.."
unzip -q nwjs.zip
echo "Extracting steamworks.."
unzip -qq steam.zip

echo "Patching game.."
mv "./nwjs-v0.102.1-osx-arm64/nwjs.app" "./OMORI.app"
mv -f ./OMORI.original.app/Contents/Resources/app.nw ./OMORI.app/Contents/Resources/
mv -f ./OMORI.original.app/Contents/Resources/app.icns ./OMORI.app/Contents/Resources/
mv -f ./node-polyfill-patch.js ./OMORI.app/Contents/Resources/app.nw/js/libs/
mv -f ./greenworks.js ./OMORI.app/Contents/Resources/app.nw/js/libs/
mv -f ./greenworks-osxarm64.node ./OMORI.app/Contents/Resources/app.nw/js/libs/
mv -f ./steam/libsteam_api.dylib ./OMORI.app/Contents/Resources/app.nw/js/libs/
mv -f ./steam/libsdkencryptedappticket.dylib ./OMORI.app/Contents/Resources/app.nw/js/libs/

echo "Finished. Moving patched game back to original location.."
mv "./OMORI.app" "${OMORI}/OMORI.app"

echo ""
echo "Done! Launch OMORI through Steam."
echo "Note that if you update OMORI or check the integrity of the game files, you'll need to reapply the patch."
echo ""
echo ""

