{pkgs ? import <nixpkgs> {}}: 

pkgs.python3Packages.buildPythonPackage {
    pname = "Coverage";
    version = "4.4.1";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/36/db/690ee79312bb60f121c0da1c973856ddb751afe09cc10caec1452208eaf4/coverage-4.4.1.tar.gz";
      sha256 = "097l4s3ssxm1vncsn0nw3a1pbzah28773q36c1ab9wz01r04973s";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  
}
