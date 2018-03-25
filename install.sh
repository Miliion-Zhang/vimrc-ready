#!/bin/bash

# color code: https://stackoverflow.com/a/5947802
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;34m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

VIMRC="${HOME}/.vimrc"
VIMRC_LOCAL="${HOME}/.vimrc.local"

# backup user's previous settings
echo -e "INFO: Backup your old vimrc setting files..."
if [ -f $VIMRC ]; then
	mv $VIMRC "${VIMRC}.ori"
fi
if [ -f $VIMRC_LOCAL ]; then
	mv $VIMRC_LOCAL "${VIMRC_LOCAL}.ori"
fi

# update vimrc settings
echo -e "\nINFO: update vimrc settings..."
cp "vimrc" $VIMRC
cp "vimrc.local" $VIMRC_LOCAL

# install the bundles
echo -e "\nINFO: install vim bundles..."
vim +NeoBundleInstall +qall

# install patched font
echo -e "\n${RED}WARN:${NC} Please install ${PURPLE}'Monaco for Powerline'${NC} font manually if you haven't!"
echo -e "      url: https://gist.github.com/Miliion-Zhang/3510f068a80d2735fd87b805c1052edb"

# let user know the dependencies
echo -e "\n${RED}WARN:${NC} VIM should be built with ${PURPLE}+conceal${NC}(for indentLine) ${PURPLE}+lua${NC}(for neocomplete) !!!"
echo -e "      You can install VIM using 'brew' on Mac or 'linuxbrew' on Ubuntu."
echo -e "\n${RED}WARN:${NC} For python, ${PURPLE}'flake8'${NC} and ${PURPLE}'autopep8'${NC} are required for syntax checking & formatting."
echo -e "\n${RED}WARN:${NC} Besides, ${PURPLE}'ctags'${NC}(for tagbar) and ${PURPLE}'ack'${NC} are also required."

echo -e "\nINFO: ${GREEN}all done! enjoy it!${NC}\n"
