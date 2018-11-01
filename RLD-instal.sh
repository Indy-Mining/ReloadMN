#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*      Reload Masternode       *"
echo "*           SETUP             *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IP==$(curl -s4 icanhazip.com)
echo -e "${GREEN}Please enter your private key: (Copy from Windows and right click to paste and press enter)${NC}" 
read KEY
sleep 2
echo ""
echo ""
echo -e "${RED}PLEASE KEEP YOUR HANDS AND FEET INSIDE THE RIDE AT ALL TIMES!${NC}"
sleep 5

cd ~
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libminiupnpc-dev libboost-all-dev build-essential libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev git build-essential libtool autoconf-archive autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install nano htop git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y 

sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

sudo git clone https://github.com/Indy-Mining/RLD-install-script.git
cd RLD-install-script

sleep 2

echo ""
echo ""
echo -e "${GREEN}Moving stuff where it ${RED}NEEDS${NC} to be"
sudo chmod +x ~/RLD-install-script/reloadd ~/RLD-install-script/reload-cli
sudo mv ~/RLD-install-script/reloadd ~/RLD-install-script/reload-cli /usr/local/bin
mkdir ~/.reload
cd ~/.reload
sudo reloadd -daemon
sleep 2
sudo reload-cli stop
echo ""
echo ""
sleep 2
echo -e "${GREEN}Creating the ${RED}Configuration File Now${NC}"
sleep 2
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> ~/.reload/reload.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> ~/.reload/reload.conf
echo "rpcallowip=127.0.0.1" >> ~/.reload/reload.conf
echo "port=24440" >> ~/.reload/reload.conf
echo "staking=1" >> ~/.reload/reload.conf
echo "logtimestamps=1" >> ~/.reload/reload.conf
echo "listen=1" >> ~/.reload/reload.conf
echo "server=1" >> ~/.reload/reload.conf
echo "daemon=1" >> ~/.reload/reload.conf
echo "maxconnections=250" >> ~/.reload/reload.conf
echo "masternode=1" >> ~/.reload/reload.conf
echo "masternodeaddr=$IP:24440" >> ~/.reload/reload.conf
echo "masternodeprivkey=$KEY" >> ~/.reload/reload.conf
echo -e "${GREEN}STARTING THE DAEMON${NC}"

sudo reloadd -daemon
sleep 2
echo ""
echo ""
echo -e "Thank you for installing the Reload wallet.  Please move onto the ${RED}NEXT${NC} step."
