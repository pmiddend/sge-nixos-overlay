{ stdenv, fetchFromGitHub, cmake, boost, fcppt2, xlibsWrapper, libX11 }:

stdenv.mkDerivation rec {
  name = "awl-${version}";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "freundlich";
    repo = "libawl";
    rev = "50f0d838d4694ae0383d0d1ed31cdccaadf02e80";
    sha256 = "1qppydpqv8jbq8cgwbycjgg09pfv4jhnapm4s0f06g3aihjcgh5y";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ boost libX11 ];

  buildFlags = [ "-v" ];

  cmakeFlags = [
    "-DENABLE_EXAMPLES=false"
    "-Dfcppt_DIR=${fcppt2}/lib/cmake/fcppt"
    "-DENABLE_X11=true"
    "-DX11_X11_LIB=${libX11}/lib/libX11.so"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "awl";
    longDescription = ''
      long description here
    '';
    license = licenses.boost;
    maintainers = with maintainers; [ pmiddend ];
    platforms = platforms.linux;
  };
}
