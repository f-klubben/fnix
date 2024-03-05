{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "idna";
    version = "2.10";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/a2/38/928ddce2273eaa564f6f50de919327bf3a00f091b5baba8dfa9460f3a8a8/idna-2.10-py2.py3-none-any.whl";
      sha256 = "1h280sli58v5dapmf79rnnqdrrk0xjn8vi3pxppknllv3r5q0zdr";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
