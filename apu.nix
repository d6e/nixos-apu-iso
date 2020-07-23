# This module defines a nixos iso for PC Engines APU https://www.pcengines.ch/apu2.htm.  It does not
# contain any graphical stuff.
#
# The iso can be built with `nix-build -A config.system.build.isoImage -I nixos-config=apu.nix default.nix`

{ ... }:

{
  imports =
    [ "${<nixpkgs>}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
    ];
  boot.kernelParams = [ "console=ttyS0,115200n8" ]; # only accessible over serial
}
