Binaries\Win64\UDK.exe make -full -stripsource
Binaries\UnSetup.exe /GameSetup
Binaries\Win64\UDK.exe CookPackages -platform=PC RV8_Global.udk -full -multilanguagecook=INT -processes=4
Binaries\UnSetup.exe -GameCreateManifest -gamename="Alone" -platform="PC"
Binaries\UnSetup.exe -BuildGameInstaller -gamename="Alone" -platform="PC"