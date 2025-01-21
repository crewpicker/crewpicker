{
  description = "Development environment for your project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShell = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = with nixpkgs.legacyPackages.x86_64-linux; [
        ruby
        nodejs
        yarn
      ];
      shellHook = ''
        # Set ZSH as the default shell
        export NIX_BUILD_SHELL="$SHELL"

        # Source your ZSH configuration files (if any)
        if [ -f ~/.zshrc ]; then
          source ~/.zshrc
        fi
      '';
    };
  };
}
