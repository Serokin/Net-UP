#!/usr/bin/env bash
root_check_init(){
    echo "Checking for Root.."
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be ran with sudo or root privileges, or this isn't going to work."
            exit 1
    else
        echo "Root Access Granted!"
    fi
}
cd $HOME
root_check_init;
HOMEDIR=$HOME/netup
if [[ -d "$HOMEDIR" ]] ; then
    echo "Directory already exists..";
    echo "Removing old copy..";
    rm -rf $HOMEDIR
else
    echo "$HOMEDIR already exists.."
fi
cd $HOME
echo "Cloning from GitHub..";
git clone https://github.com/private-locker/NET-UP.git $HOMEDIR
cd $HOMEDIR
echo "Cloning Modules from Repo.";
git clone https://github.com/private-locker/modules.git $HOMEDIR/modules
echo -e "Changing Permissions of Files..";
chmod +x $HOMEDIR/netup
chmod +x $HOMEDIR/modules/enablemod
chmod +x $HOMEDIR/modules/disablemod
cd $HOME
echo -e "Cleaning up Install Script File.."
rm -rf "$HOMEDIR/install.sh"
rm -rf "$0";
echo -e "Running Net-UP..";
bash $HOMEDIR/netup
echo -e "Exiting.. You can now use netup anywhere in the system."
exit

