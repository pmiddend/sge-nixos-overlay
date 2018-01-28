{ stdenv, fetchFromGitHub, cmake, boost, brigand }:

stdenv.mkDerivation rec {
  name = "fcppt2-${version}";
  version = "2.7.0";

  src = fetchFromGitHub {
    owner = "freundlich";
    repo = "fcppt";
    rev = "2c095d9d492711663c06b97074a5a6f2786c9b9e";
    sha256 = "0j6v4prhcrq3ibgl9gyr88c5j98w9z9gzhgm9jk19h311bchy2la";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ boost ];

  cmakeFlags = [ "-DENABLE_EXAMPLES=false" "-DENABLE_TEST=false" "-DBRIGAND_INCLUDEDIR=${brigand}/include" ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "Freundlich's C++ toolkit";
    longDescription = ''
      Freundlich's C++ Toolkit (fcppt) is a collection of libraries focusing on
      improving general C++ code by providing better types, a strong focus on
      C++11 (non-conforming compilers are mostly not supported) and functional
      programming (which is both efficient and syntactically affordable in
      C++11).
    '';
    homepage = http://fcppt.org;
    license = licenses.boost;
    maintainers = with maintainers; [ pmiddend ];
    platforms = platforms.linux;
  };
}
