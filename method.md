# Technical Writeup on the OMORI arm64 patch

## Quick outline
* Repackage omori into nw.js v0.77.0 ([7323cc662](https://dl.nwjs.io/live-build/nw77/20230531-164722/7323cc662/v0.77.0/))
* Update steamworks to 1.53a (`libsteam_api.dylib` and `libsdkencryptedappticket.dylib`)
* Patch [greenworks](https://github.com/SnowpMakes/greenworks-arm64) to compile to arm64 with steamworks 1.53a

