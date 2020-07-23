FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update
#RUN adduser -g '' -D dockeruser
#USER dockeruser
RUN cd /tmp && wget -qO- -O tmp.zip https://github.com/NixOS/nixpkgs/archive/19a94e60da098a02c5055ce46a26d00d03381847.zip && unzip tmp.zip && rm tmp.zip && mv nixpkgs* nixpkgs
WORKDIR /tmp/nixpkgs/nixos
RUN sed -i '/isoImage.isoName/a boot.kernelParams = [ "console=ttyS0,115200n8" ];' modules/installer/cd-dvd/installation-cd-base.nix
RUN nix-build -A config.system.build.isoImage -I nixos-config=modules/installer/cd-dvd/installation-cd-minimal.nix default.nix
