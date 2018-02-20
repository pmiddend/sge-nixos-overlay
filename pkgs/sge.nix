{ stdenv, fetchFromGitHub, cmake, fcppt2, mizuiro, awl, boost, xorg, mesa, pkgconfig, libpng, pango, freetype }:

stdenv.mkDerivation rec {
  name = "sge-${version}";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "freundlich";
    repo = "spacegameengine";
    rev = "421a93e19cae1e86e4468ecb5a0b9f06f79c5f72";
    sha256 = "1akvp8byzgmvjblvwsc7ngch58as3ncsrg52rria6xmi78gnh27a";
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  # libXext is sort of unnecessary, but stuff doesn't build without it
  # same goes for everything after Xext
  buildInputs = [ boost xorg.libXrandr xorg.libXi mesa awl xorg.libXext xorg.libX11 xorg.libpthreadstubs xorg.libXdmcp xorg.libXau libpng pango freetype ];

  cmakeFlags = [
    "-DENABLE_EXAMPLES=ON"
    "-DINSTALL_EXAMPLES=ON"
    "-DENABLE_X11INPUT=ON"
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
