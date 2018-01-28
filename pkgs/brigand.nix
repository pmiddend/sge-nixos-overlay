{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  name = "brigand-${version}";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "edouarda";
    repo = "brigand";
    rev = "4db9f665b4ece31b51aaf35b499b2c8e5811efa3";
    sha256 = "14b8r3s24zq0l3addy3irzxs5cyqn3763y5s310lmzzswgj1v7r4";
  };

  nativeBuildInputs = [ cmake ];

  # cmakeFlags = [ "-DENABLE_EXAMPLES=false" "-DENABLE_TEST=false" ];

  # enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "brigand";
    longDescription = "";
    maintainers = with maintainers; [ pmiddend ];
    platforms = platforms.linux;
  };
}
