GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# (permissions, user, group, destination)
# source is assumed to be "./destination"
install_thingy() {
  if [ -e $4 ]; then
    printf "${YELLOW}WARN: file '$4' already exists. Overwrite? (y/n)${NC}%s "
    read -r YN
  else
    YN="Y"
  fi
  if [ "$YN" = "y" ]||[ "$YN" = "Y" ]; then
    install -D -m $1 -o $2 -g $3 "./$4" $4
    printf "${GREEN}OK: $4${NC}%s "
  fi
}

install_thingy 755 root root "/etc/systemd/system/systemd-networkd-wait-online.service.d/override.conf"
