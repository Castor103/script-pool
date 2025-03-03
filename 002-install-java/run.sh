brew install openjdk@17

echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc

source ~/.zshrc

java -version