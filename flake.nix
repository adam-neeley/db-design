{
  description = "A Nix-flake-based Shell development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems (system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          });
    in {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            # oracle-instantclient # sqliteplus
            sshpass
            (pkgs.writeShellScriptBin "connect-oracle"
              (builtins.readFile ./connect-oracle.sh))
          ];
          # shellHook = "connect-oracle";
          # shellHook = ''
          #   nix-shell -p sshpass --run "sshpass -f.pass ssh atn22@nrs-projects-ssh.humboldt.edu -t sqlplus /"
          # '';
        };
      });
    };
}
