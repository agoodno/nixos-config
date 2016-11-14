# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.firefox.enableAdobeFlash = true; # for Firefox
  nixpkgs.config.chromium.enableAdobeFlash = true; # for Chromium

  networking.hostName = "nub"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables network manager

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.wireless.networks = {
  #   home = {};
  # };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ack
    emacs
    chruby
    conkeror
    firefox
    git
    imagemagick
    keepass
    openssh
    ruby_2_1
    ssh-ident
    stumpwm
    thunderbird
    wget
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.autorun = false;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the Desktop Environment.
  # services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  # services.xserver.desktopManager.default = "gnome3";
  # services.xserver.windowManager.stumpwm.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.guest = {
    isNormalUser = true;
    home = "/home/guest";
    description = "Guest User";
    extraGroups = [ "wheel" ];
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";
}
