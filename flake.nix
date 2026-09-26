{
  description = "verein devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nele = {
      url = "github:raphiz/nele";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nele,
      ...
    }:
    let
      systems = nixpkgs.lib.platforms.unix;
      eachSystem =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f (
            import nixpkgs {
              inherit system;
              config = {
                allowUnfreePredicate =
                  pkg:
                  builtins.elem (nixpkgs.lib.getName pkg) [
                    "banana-accounting"
                  ];
              };
              overlays = [ ];
            }
          )
        );
    in
    {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          TYPST_FONT_PATHS = "${pkgs.lib.escapeShellArg pkgs.ubuntu-sans}";
          packages = with pkgs; [
            typst
            typstyle
            nele.packages.${pkgs.stdenv.hostPlatform.system}.nele
            (pkgs.writeShellScriptBin "sqlite-wrapped" ''
              ${pkgs.lib.getExe pkgs.rlwrap} ${pkgs.lib.getExe pkgs.sqlite} "$@"
            '')
            (banana-accounting.overrideAttrs {
              srcs = fetchurl {
                url = "https://www.banana.ch/accounting/files/bananaplus/exe/bananaplus.tgz";
                hash = "sha256-UX4QO+muA4U97V7S7cXHMtTHpEXheJNiirSHXRAOjEM=";
              };
            })
            ledger
          ];
          shellHook = ''
            unset SOURCE_DATE_EPOCH
          '';
        };
      });
    };
}
