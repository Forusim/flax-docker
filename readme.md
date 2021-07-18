![](https://flaxnetwork.org/logo.svg)

# Flax Docker Container
https://flaxnetwork.org/

## Configuration
Required configuration:
* Publish network port via `-p 6888:6888`
* Bind mounting a host plot dir in the container to `/plots`  (e.g. `-v /path/to/hdd/storage/:/plots`)
* Bind mounting a host config dir in the container to `/root/.flax`  (e.g. `-v /path/to/storage/:/root/.flax`)
* Set initial `flax keys add` method:
  * Manual input from docker shell via `-e KEYS=type` (recommended)
  * Copy from existing farmer via `-e KEYS=copy` and `-e CA=/path/to/mainnet/config/ssl/ca/` 
  * Add key from mnemonic text file via `-e KEYS=/path/to/mnemonic.txt`
  * Generate new keys (default)

Optional configuration:
* Pass multiple plot directories via PATH-style colon-separated directories (.e.g. `-e plots_dir=/plots/01:/plots/02:/plots/03`)
* Set desired time zone via environment (e.g. `-e TZ=Europe/Berlin`)

On first start with recommended `-e KEYS=type`:
* Open docker shell `docker exec -it <containerid> sh`
* Enter `flax keys add`
* Paste space-separated mnemonic words
* Restart docker cotainer
* Enter `flax wallet show`
* Press `S` to skip restore from backup

## Operation
* Open docker shell `docker exec -it <containerid> sh`
* Check synchronization `flax show -s -c`
* Check farming `flax farm summary`
* Check balance `flax wallet show` 
