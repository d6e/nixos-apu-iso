# Nixos on PC Engines APU
To build a nixos iso for https://pcengines.ch/apu2.htm
```
nix-build -A config.system.build.isoImage -I nixos-config=apu.nix -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz
```
