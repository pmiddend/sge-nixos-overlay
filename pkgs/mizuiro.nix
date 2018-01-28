{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  name = "mizuiro-${version}";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "freundlich";
    repo = "mizuiro";
    rev = "e1a77ff94cf11f5d2515424a923886cb62cb02dc";
    sha256 = "1yxnk8ppl1j5gh2vsasjnh04cg657c5lyhapz092gyjni3xipvz7";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];

  cmakeFlags = [
    "-DENABLE_EXAMPLES=false"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "mizuiro";
    longDescription = ''
      long description here
    '';
    license = licenses.boost;
    maintainers = with maintainers; [ pmiddend ];
    platforms = platforms.linux;
  };
}
