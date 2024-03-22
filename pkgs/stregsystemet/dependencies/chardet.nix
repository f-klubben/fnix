{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "chardet";
    version = "3.0.4";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl";
        sha256 = "14b621614q2lw7ik2igdv4qdbblqgdsiglgl5fhf1l5fmvy3ycpw";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  }
