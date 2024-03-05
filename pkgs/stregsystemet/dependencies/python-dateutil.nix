{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "python-dateutil";
    version = "2.9.0.post0";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ec/57/56b9bcc3c9c6a792fcbaf139543cee77261f3651ca9da0c93f5c1221264b/python_dateutil-2.9.0.post0-py2.py3-none-any.whl";
        sha256 = "09q48zvsbagfa3w87zkd2c5xl54wmb9rf2hlr20j4a5fzxxvrcm8";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
        (pkgs.callPackage ./six.nix {})
    ];
  }
