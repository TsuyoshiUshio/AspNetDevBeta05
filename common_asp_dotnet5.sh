
# Install Mono

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install -y mono-complete
sudo apt-get install -y autoconf automake build-essential libtool curl
# Install libuv

curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

# Install the .NET Version Manager(DNVM)
sudo su - vagrant && curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
source /home/vagrant/.dnx/dnvm/dnvm.sh

sudo apt-get install -y unzip

dnvm install 1.0.0-beta5
dnvm use 1.0.0-beta5

sudo apt-get update
sudo apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget \
	&& sudo rm -rf /var/lib/apt/lists/*

sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get update
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/sbin/node
npm install grunt
