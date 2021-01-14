{
  description = "Web interface for Mantis Faucet";

  inputs.utils.url = "github:kreisys/flake-utils";

  outputs = { self, nixpkgs, utils }:
    utils.lib.simpleFlake
      {
        inherit nixpkgs;
        name = "mantis-faucet-web";
        systems = [ "x86_64-linux" "x86_64-darwin" ];
        overlay = final: prev: {
          mantis-faucet-web = final.callPackage ./package.nix { };
        };

        packages = { mantis-faucet-web }: {
          inherit mantis-faucet-web;
          defaultPackage = mantis-faucet-web;
        };
      };
}
