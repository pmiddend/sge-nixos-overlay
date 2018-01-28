self: super:

{
  brigand = super.callPackage ./pkgs/brigand.nix {
    stdenv = self.stdenv;
  };

  fcppt2 = super.callPackage ./pkgs/fcppt.nix {
    stdenv = self.stdenv;
  };

  awl = super.callPackage ./pkgs/awl.nix {
    stdenv = self.stdenv;
  };

  mizuiro = super.callPackage ./pkgs/mizuiro.nix {
    stdenv = self.stdenv;
  };

  sge = super.callPackage ./pkgs/sge.nix {
    stdenv = self.stdenv;
  };
}
