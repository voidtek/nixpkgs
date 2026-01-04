{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.kotlin
    pkgs.gradle
    pkgs.openjdk21
    pkgs.android-studio
    pkgs.android-tools
  ];

  shellHook = ''
    ${shellCustom}
    
    # Accept Android SDK licenses
    export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
    export ANDROID_HOME="$ANDROID_SDK_ROOT"
    mkdir -p "$ANDROID_SDK_ROOT/licenses"
    echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_SDK_ROOT/licenses/android-sdk-license"
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_SDK_ROOT/licenses/android-sdk-preview-license"
    
    echo ""
    echo "██╗  ██╗ ██████╗ ████████╗██╗     ██╗███╗   ██╗"
    echo "██║ ██╔╝██╔═══██╗╚══██╔══╝██║     ██║████╗  ██║"
    echo "█████╔╝ ██║   ██║   ██║   ██║     ██║██╔██╗ ██║"
    echo "██╔═██╗ ██║   ██║   ██║   ██║     ██║██║╚██╗██║"
    echo "██║  ██╗╚██████╔╝   ██║   ███████╗██║██║ ╚████║"
    echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝"
    echo ""
    echo "Welcome to the Kotlin development environment!"
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, ncdu, cacert, gnupg, git, kotlin, gradle, openjdk21, android-studio, android-tools"
    echo "Android SDK licenses automatically accepted"
    echo ""

    ${fishLaunch}
  '';
}
