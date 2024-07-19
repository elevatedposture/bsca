#
#   #########################################################################
#
#   Application:    Basically Shenanigans Certificate Authority (“BSCA”) 
#   Module:         Online install script
#
#   #########################################################################
#
#   Elevated Posture Incorporated
#   great.service@elevatedposture.ca
#
#   Licensed with Creative Commons Attribution-NonCommercial-ShareAlike
#   https://creativecommons.org/licenses/by-nc-nd/4.0/
#
#   #########################################################################
#

BSCAPATH="/opt/bsca"

echo " "
echo " "
echo "##"
echo "##"
echo "## This is the Basically Shenanigans Certificate Authority (“BSCA”) Installer"
echo "## BSCA is a very early BETA, use at your own risk!"
echo "##"
echo "##"
echo " "
echo " "

echo "BSCA-INSTALLER : Starting installation"

## CHECK FOR ROOT
if [ $EUID -gt 0 ]
then
        echo "BSCA-INSTALLER : ERROR Please run me as root"
        exit 1
fi

## CHECK FOR PREVIOUS INSTALLATION
if [ -d $BSCAPATH ]
then
    echo "BSCA-INSTALLER : ERROR Please don't run me more than once"
    exit 666
fi

## SETUP DIRS
mkdir -p $BSCAPATH/help
mkdir -p $BSCAPATH/private
mkdir -p $BSCAPATH/templates
mkdir -p $BSCAPATH/public
mkdir -p $BSCAPATH/run/signed
mkdir -p $BSCAPATH/staging

## PLACE FILES
curl -o $BSCAPATH/help/generate-csr-server.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/generate-csr-server.txt
curl -o $BSCAPATH/help/generate-csr-user.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/generate-csr-user.txt
curl -o $BSCAPATH/help/version.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/version.txt
curl -o $BSCAPATH/help/readme.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/readme.txt
curl -o $BSCAPATH/help/setup-ca.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/setup-ca.txt
curl -o $BSCAPATH/help/sign-csr.txt https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/help/sign-csr.txt
curl -o $BSCAPATH/private/root-ca.cnf https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/private/root-ca.cnf
curl -o $BSCAPATH/private/signing-generic.cnf https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/private/signing-generic.cnf
curl -o $BSCAPATH/run/database https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/run/database
curl -o $BSCAPATH/run/serial https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/run/serial
curl -o $BSCAPATH/templates/csr-generic_tls_server.cnf https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/templates/csr-generic_tls_server.cnf
curl -o $BSCAPATH/templates/csr-generic_user.cnf https://raw.githubusercontent.com/elevatedposture/bsca/main/install-files/templates/csr-generic_user.cnf

## CHOWN DIRS AND FILES
chown root:root -R $BSCAPATH

## CHMOD DIRS
find $BSCAPATH -type d -exec chmod 700 {} \;

## CHMOD FILES
find $BSCAPATH -type f -exec chmod 600 {} \;

## DELETE SELF
## Disabled by default until the script matures
#eval 'eval "sleep 1;rm -f install-bsca.sh;rm -fr bsca-install-files;" &'

echo "BSCA-INSTALLER : Finished installation"

exit $R
