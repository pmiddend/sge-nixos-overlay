{ stdenv, fetchFromGitHub, cmake, fcppt2, mizuiro, awl, boost, xorg, mesa }:

stdenv.mkDerivation rec {
  name = "sge-${version}";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "freundlich";
    repo = "spacegameengine";
    rev = "75542a5c8548282bf37b515dc2a9e493226f8542";
    sha256 = "1fq4rqfk3y7yd7za0p90c5kgs6000ifr0lp2gjfhj08rv8fg9q6b";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ boost xorg.libXrandr mesa awl ];

  cmakeFlags = [
    "-DENABLE_EXAMPLES=ON"
    "-DINSTALL_EXAMPLES=ON"
    "-DENABLE_RENDEREROPENGL=ON"
    "-DENABLE_OPENGL=ON"
    "-DCMAKE_INSTALL_LIBDIR=lib"
    "-Dfcppt_DIR=${fcppt2}/lib/cmake/fcppt"
    "-Dawl_DIR=${awl}/lib/cmake/awl"
    "-Dmizuiro_DIR=${mizuiro}/lib/cmake/mizuiro"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "sge";
    longDescription = ''
      long description here
    '';
    license = licenses.boost;
    maintainers = with maintainers; [ pmiddend ];
    platforms = platforms.linux;
  };
}
