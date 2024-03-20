{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "pytz";
    version = "2021.3";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d3/e3/d9f046b5d1c94a3aeab15f1f867aa414f8ee9d196fae6865f1d6a0ee1a0b/pytz-2021.3-py2.py3-none-any.whl";
        sha256 = "0z5qylvysr2zy9n2ylaiwkd0paympz1s3dxa4av5fd25qf5hawin";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
