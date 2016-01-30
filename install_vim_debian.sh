#!/usr/bin/env bash
#==============================================================================
# GVim compile and install script for Debian
#
# Description:  Install VIM with +python/+python3 via pyenv installed pythons
# Author:       Alisue <lambdalisue@hashnote.net>
# License:      MIT
#==============================================================================

# Install required packages
echo "Install required packages..."
# fundemental requirements
sudo apt-get install -y -q \
    build-essential wget curl checkinstall
# vim requirements
sudo apt-get install -y -q \
    libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    liblua5.2-dev lua5.2 ruby-dev ruby
# pyenv requirements (to compile Python)
sudo apt-get install -y -q \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm

if [[ $(which pyenv >/dev/null 2>&1) ]]; then
    echo "'pyenv' chould not be found. This script use python and python3"
    echo "installed via 'pyenv' thus install it first as:"
    echo 
    echo "> curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash"
    echo
    exit 1
fi

# Find out latest stable version
LATEST2=$(pyenv install -l | grep -E "^  2\.[0-9]+\.[0-9]+$" | tail -1 | sed -e 's/^[[:space:]]+//')
LATEST3=$(pyenv install -l | grep -E "^  3\.[0-9]+\.[0-9]+$" | tail -1 | sed -e 's/^[[:space:]]+//')

# Install Python 2 and Python 3
echo "Install Python $LATEST2 and $LATEST3. It takes minutes so be patient..."
CONFIGURE_OPTS="--enable-shared --enable-unicode=ucs4" pyenv install $LATEST2
CONFIGURE_OPTS="--enable-shared" pyenv install $LATEST3

echo "Downloading VIM..."
if [[ ! -d vim ]]; then
    git clone https://github.com/vim/vim
    cd vim
else
    cd vim
    git reset --hard
    sudo git clean -fd
    git pull
fi

echo "Configure & compiling VIM..."
pyenv deactivate
# Activate 2.7 and 3.4
pyenv local $LATEST2 $LATEST3

sudo make distclean
./configure \
    --enable-fail-if-missing \
    --with-features=huge \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp \
    --enable-multibyte \
    --enable-fontset \
    --enable-gui=gtk2 \
    --enable-cscope

if [[ $? ]]; then
    make

    echo "Installing Vim..."
    sudo checkinstall

	#add python libraries to ld.so.conf.d
sudo tee -a /etc/ld.so.conf.d/usrlib.conf << EOF
$PYENV_ROOT/versions/$LATEST2/lib
$PYENV_ROOT/versions/$LATEST3/lib
EOF

	sudo ldconfig -v

    #if [ ! -d "${HOME}/.local/share/applications" ]; then
    #    mkdir -p "${HOME}/.local/share/applications"
    #fi
    #
    #cat <<EOF > ${HOME}/.local/share/applications/gvim.desktop
    ##!/usr/bin/env xdg-open
    #[Desktop Entry]
    #Name=GVim
    #Version=7.4
    #GenericName=Editor
    #Comment=Graphical version of Vim
    #Terminal=false
    #Icon=gvim
    #Type=Application
    #Exec=gvim %U
    #TryExec=gvim
    #Categories=Programming; System Utilities
    #EOF
fi
