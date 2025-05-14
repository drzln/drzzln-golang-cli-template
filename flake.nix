# flake.nix
{
  description = "Go CLI with Nix flake support";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    # self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system}.default = pkgs.buildGoModule {
      pname = "hello";
      version = "0.1.0";
      src = ./.;

      subPackages = ["cmd/hello"];

      vendorSha256 = pkgs.lib.fakeSha256; # replace after first build
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [pkgs.go pkgs.gopls];
      shellHook = ''
        echo "Go devshell ready: use 'go build', 'go test', or run './cmd/hello/main.go'"
      '';
    };
  };
}
