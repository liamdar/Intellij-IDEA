#!/bin/bash
set -e

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

install_if_missing() {
    cmd=$1
    install_cmd=$2
    if ! command -v $cmd >/dev/null 2>&1; then
        eval "$install_cmd"
    fi
}

install_if_missing git "sudo apt-get install -y git"
install_if_missing zip "sudo apt-get install -y zip"
install_if_missing unzip "sudo apt-get install -y unzip"
install_if_missing tar "sudo apt-get install -y tar"
install_if_missing curl "sudo apt-get install -y curl"
install_if_missing wget "sudo apt-get install -y wget"
install_if_missing build-essential "sudo apt-get install -y build-essential"

install_if_missing node "curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs"
install_if_missing npm "sudo apt-get install -y npm"

if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

install_if_missing java "sdk install java 17.0.0-tem && sdk default java 17.0.0-tem"
install_if_missing java "sdk install java && sdk default java"
install_if_missing mvn "sdk install maven"
install_if_missing gradle "sdk install gradle"
install_if_missing kotlinc "sdk install kotlin"

java -version
javac -version
mvn -version
gradle -version
kotlinc -version
node -v
npm -v
git --version
zip -v
unzip -v
tar --version
curl --version
wget --version
