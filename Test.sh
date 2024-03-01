#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    curl -fsSL "https://setup.rbxcdn.com/mac/version-61a8e712340e48b2-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    echo -e "Installing Latest Roblox"
    if [ -d "/Applications/Roblox.app" ]; then
        rm -rf "/Applications/Roblox.app"
    fi
    unzip -o -q "./RobloxPlayer.zip" -d "/Applications/"
    rm "./RobloxPlayer.zip"
    
    echo -e "Downloading libHydrogen"
    curl -fsSL -o "./libHydrogen.dylib" "https://github.com/retguard/laughing-octo-invention/raw/main/libHydrogen.dylib"

    echo -e "Downloading insert_dylib"
    curl -fsSL -o "./insert_dylib" "https://github.com/retguard/legendary-couscous/raw/main/insert_dylib"
    chmod +x "./insert_dylib"

    echo -e "Patching Roblox"
    mv "./libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    "./insert_dylib" "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    chmod +x "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    
    echo -e "Install Complete!"
}

main
