#! /bin/sh

# TODO: ぶんかつしたい
echo "Installing pyenv"
echo "    Installing some tools for build environment"

if type brew > /dev/null 2>&1; then
  xcode-select --install
  # optional, but recommended:
  brew install openssl libyaml libffi
  # required for building Ruby <= 1.9.3-p0:
  brew tap homebrew/dupes && brew install apple-gcc42
elif type apt > /dev/null 2>&1; then
  apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
elif type yum > /dev/null 2>&1; then
  yum install -y gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
fi

echo "    done"

# Install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo "done"
echo "Please install Python in global"
echo "---"
echo "$ pyenv versions"
echo "---"
echo ""
