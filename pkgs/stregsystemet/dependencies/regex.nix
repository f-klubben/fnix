{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "regex";
    name = "regex";
    version = "2017.07.28";
    src = pkgs.fetchPypi {
        pname = "regex";
        version = "2017.07.28";
        sha256 = "sha256-J6sYJDsaCqFGcCe+k7EYyfzWDdLkAg2lefrTAIvEY48=";
    };
    doCheck = false;
}
