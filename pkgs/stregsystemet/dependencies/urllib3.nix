{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "urllib3";
    version = "1.25.11";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/56/aa/4ef5aa67a9a62505db124a5cb5262332d1d4153462eb8fd89c9fa41e5d92/urllib3-1.25.11-py2.py3-none-any.whl";
      sha256 = "0pnxjyc33d162wrxmk285av9x44h9sqpzzhbzl7gmzpk9fz1ycpm";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
