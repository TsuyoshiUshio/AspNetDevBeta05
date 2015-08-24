source /tmp/user-shell/common_ubuntu.sh
source /tmp/user-shell/common_asp_dotnet5.sh

sudo apt-get install -y git

git clone https://github.com/Microsoft/PartsUnlimited.git

cd PartsUnlimited

git checkout -b dev/beta5 origin/dev/beta5

sudo npm install -g grunt-cli

dnu restore
cd src/PartsUnlimitedWebsite
dnx . kestrel
