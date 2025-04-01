# happy_compose
use bash script instead of docker-compose to start containers.
docker run command can be easily transformed into docker-compose.yaml file by GPT.

## Usage
1. install git and clone this repository
```
git clone https://github.com/yangjiacheng1996/happy_compose.git
```
2. buy a linux server and install docker and docker-compose, you can quick install them by 1panel
```
# Redhat/CentOS
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh

# Debian
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh

# Ubuntu
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh

# OpenEuler and other Linux distributions
bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
```
3. run bash script
```commandline
bash xxx.sh
```

