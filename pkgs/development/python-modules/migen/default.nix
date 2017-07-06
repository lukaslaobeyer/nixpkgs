{ stdenv, fetchFromGitHub, python, buildPythonPackage,
  colorama, sphinx, sphinx_rtd_theme, verilator }:

buildPythonPackage rec {
  version = "git_d8b55c";
  pname = "migen";
  name = "${pname}-${version}";
  
  src = fetchFromGitHub {
    owner = "m-labs";
    repo = "migen";
    rev = "d8b55c7f06dab29de667c825726e6621483bf883";
    sha256 = "0fsxqiscvcj000x5idg4w4bh3a4xw6zamxmi0scyg8fpk0rg6abd";
  };

  nativeBuildInputs = [ colorama sphinx sphinx_rtd_theme ];
  buildInputs = [ verilator ];

  meta = with stdenv.lib; {
    description = "A Python toolbox for building complex digital hardware";
    homepage    = "https://m-labs.hk/gateware.html";
    license     = licenses.bsd2;
    platforms   = platforms.unix;
  };
}
