{
  description = "humboldt db design (fall 2024)";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
        (system: f { pkgs = import nixpkgs { inherit system; }; });
      mountPath = "./public";
      serverName = "nrs-projects-ssh.humboldt.edu";
    in {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            eza
            sshfs
            (writeShellScriptBin "connect-humboldt.edu" ''
              echo "Connecting ${serverName}"
              ssh atn22@nrs-projects-ssh.humboldt.edu -i /home/adam/.ssh/adam@iron
            '')
            (writeShellScriptBin "unmount-humboldt.edu" ''
              echo "Unmounting ${serverName}..."
              fusermount -u --lazy ${mountPath}
            '')
            (writeShellScriptBin "mount-humboldt.edu" ''
              echo "Mounting ${serverName}..."
              sshfs atn22@${serverName}:/home/atn22 ${mountPath} -o IdentityFile=/home/adam/.ssh/adam@iron
              eza --tree --level 3 ${mountPath}
            '')
          ];
        };
      });
    };
}
