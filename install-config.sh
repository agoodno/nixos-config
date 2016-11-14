#TODO change bak to a datestamp
sudo mv /etc/nixos /etc/nixos.bak

# create a fresh directory
sudo mkdir -p /etc/nixos/

# Copy the existing hardware config back
sudo cp -p /etc/nixos.bak/hardware-configuration.nix /etc/nixos/hardware-configuration.nix

# Copy the config
sudo ln -sr configuration.nix /etc/nixos/configuration.nix
