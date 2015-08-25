mkdir -p ~/.config/NuGet
mv /tmp/user-shell/NuGet.Config ~/.config/NuGet/NuGet.Config

source /tmp/user-shell/common_ubuntu.sh
source /tmp/user-shell/common_asp_dotnet5.sh

sudo apt-get install -y git

git clone https://github.com/Microsoft/PartsUnlimited.git

cd PartsUnlimited

git checkout -b dev/beta5 origin/dev/beta5

#bad know-how for this repository. Until it will fix this.
mv /tmp/user-shell/inventory_project.json ~/PartsUnlimited/src/PartsUnlimited.WebJobs.UpdateProductInventory/project.json

sudo npm install -g grunt-cli

export MONO_THREADS_PER_CPU=2000

dnvm use 1.0.0-beta5
dnu restore
cd src/PartsUnlimitedWebsite
dnx . kestrel
