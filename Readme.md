## Reload Masternode Installation
Shell script to install a RLD Masternode on a Linux server running Ubuntu 16.04. Use it on your own risk.

If you have never built a linux VPS masternode before you will need a few things before you start.  You will need an Ubuntu 16.04 VPS the $5 version works fine.  I suggest using vultr.  Here is a link https://www.vultr.com/?ref=7505602.  You will also need a way to access your VPS, I suggest puTTY.  Here is a link https://www.putty.org/. 

Next you will need to download the most recent version of the Reload wallet onto your computer. Here is a link.....

Next, I like to make a notepad file with all the information I will need for my masternode build.  Here is how I set up the information.  Do not just copy the informaiton here, this is not actual information it is just here as an example. 

MN1	

IP:       146.27.111.47

password: qB*6}2457g2CTGaC

gen key: 	2srx3Z6TXPQmQqUNqMZy2Ktcem6fJPHyX8acZU6zBht8fgFkcN7

address:	PPLAUoRpp9ycg5Qd9sjtbw1E8JjqPdsKJf

TXid: 		79f57fff8f781d86d1ea9c4e7c513cc72ggbb817ef2f29ce7cd9f0b553126fb17 0

MN1 146.27.111.47:24440 2srx3Z6TXPQmQqUNqMZy2Ktcem6fJPHyX8acZU6zBht8fgFkcN7 79f57fff8f781d86d1ea9c4e7c513cc22cbb817ef2f29ce7cd9f0b553126fb17 0

As you get this information save it in this file for later.  

## In The Desktop wallet 

Go to tools - Debug Console and type the following 
```
masternode genkey
```
Copy and paste this in your notepad document for later use. 



***

## VPS Installation for version X.X.X

Next you will need to access your VPS.  Using PuTTY, paste the IP address of your VPS into the box marked IP address.  
Click the open button.  If this is your first time accessing this VPS, PuTTY will ask you to verify that you want to access it. 
Log in as root and use the password provided by the VPS service.  

Next copy and paste the following command and hit enter.  Use the right mouse button to paste.  

```
cd && sudo apt-get update -y && sudo apt-get update -y && sudo apt-get install p7zip-full -y && sudo apt-get -y install git && sudo git clone https://github.com/Indy-Mining/ReloadMN && cd ReloadMN/ && sudo bash RLD-instal.sh
```
***

When prompted copy and paste your masternode genkey into PuTTY.  

Your masternode is now loading.  You can watch it load or you can minimize PuTTY and start work on your desktop wallet.
You may want to check in from time to time depending on the memory of your VPS the system may ask you to continue at some point. 

## Desktop wallet setup

You will need to configure the desktop wallet accordingly. Here are the steps:

1.Open the Reload Desktop Wallet.

2.Go to RECEIVE and create a New Address: MN1

3.Send 15,000,000 RLD to MN1.

4.Wait for 16 confirmations.

5.Go to Tools -> "Debug Console"

6.Type the following command: masternode outputs.  Save the response in your note pad.  

7. In your notepad you are going to create the folloing line based on the information you have saved. It should look something like the example above.

```
Alias Address Genkey TxHash TxIndex
```
*Alias: MN1
*Address: VPS_IP:PORT
*Privkey: Value from setp 6
*TxHash: First value from Step 7
*TxIndex: Second value from Step 7

Next you will need to open the Reload file on your computer.  If you used to standard install it should be located in 
C:\Users\User_name\AppData\Roaming

Using notepad, open the folder named 
``` 
masternode.conf
```
Copy and paste your masternode line into the file, save and close.  It should look something like this:
MN1 146.27.111.47:24440 2srx3Z6TXPQmQqUNqMZy2Ktcem6fJPHyX8acZU6zBht8fgFkcN7 79f57fff8f781d86d1ea9c4e7c513cc22cbb817ef2f29ce7cd9f0b553126fb17 0

Note, any line with a # sign in front of it will be ignored. 

Now close the desktop Reload wallet and restart it. 

Make sure your the transaction for your collateral has 16 confirmations. 
Go to Masternode Tab. If you tab is not shown, please enable it from: Settings - Options - Wallet - Show Masternodes Tab
Click Update status to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is unlocked.
Select your MN and click Start Alias to start it.

Check your masternode status by running the following command. If you get **status 4**, it means your masternode is active.
```
reload-cli masternode status
```
***

## Usage:
```
reload-cli mnsync status
reload-cli masternode status  
reload-cli getinfo
```
Also, if you want to check/start/stop reload, run one of the following commands as root:
```
reloadd
reload-cli stop 
```
***


I would like to thank ALpha515 and Indy for all the hard work they put into building this script.  If you would like to help fund further development please feel free to donate to the below address. 
## Donations


