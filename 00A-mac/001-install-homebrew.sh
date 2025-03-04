/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# ref : https://ghdwlsgur.github.io/docs/Docker/machine_vs_desktop

brew install --cask docker # /var/run/docker.sock 관련 때문에 --cask 옵션 필수?!
brew install docker-compose minikube docker-credential-helper

################################################################################################
# 1) virtualbox, virtualbox-extension-pack 설치
brew install -—cask virtualbox virtualbox-extension-pac#

# 가상머신(minikube) 실행
# minikube start --driver=virtualbox 
# 😄  minikube v1.35.0 on Darwin 14.5 (arm64)
# ✨  Using the virtualbox driver based on user configuration
# ❌  Exiting due to DRV_UNSUPPORTED_OS: The driver 'virtualbox' is not supported on darwin/arm64

################################################################################################
# 2) hyperkit
# brew install hyperkit
# ==> Downloading https://formulae.brew.sh/api/formula.jws.json
# Warning: hyperkit has been deprecated because it is not maintained upstream! It will be disabled on 2025-06-06.
# hyperkit: A full installation of Xcode.app 9.0 is required to compile
# this software. Installing just the Command Line Tools is not sufficient.

# Xcode can be installed from the App Store.
# hyperkit: The x86_64 architecture is required for this software.
# Error: hyperkit: Unsatisfied requirements failed this build.

# minikube start --driver=hyperkit 

################################################################################################
# ref : https://github.com/abiosoft/colima
# 3) colima
brew install colima
# Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
# Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
# ==> Caveats
# ==> colima
# zsh completions have been installed to:
#   /opt/homebrew/share/zsh/site-functions
# To start colima now and restart at login:
#   brew services start colima
# Or, if you don't want/need a background service you can just run:
#   /opt/homebrew/opt/colima/bin/colima start -f

/opt/homebrew/opt/colima/bin/colima start -f

colima start

################################################################################################

#eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

# 가상 머신 리소스(도커를 위한 리소스) 설정
minikube config set driver virtualbox
minikube config set memory 4096
minikube config set cpus 7
minikube config view

# 가상 머신 상태 확인
minikube status
