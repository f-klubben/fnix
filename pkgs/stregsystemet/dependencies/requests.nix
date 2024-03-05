{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "requests";
    version = "2.24.0";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/45/1e/0c169c6a5381e241ba7404532c16a21d86ab872c9bed8bdcd4c423954103/requests-2.24.0-py2.py3-none-any.whl";
        sha256 = "165qrd22rm0fp23kzfdc6qy12jv0fm7j4jbhzi394fs4m6acqxgy";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
        (pkgs.callPackage ./certifi.nix {})
        (pkgs.callPackage ./chardet.nix {})
        (pkgs.callPackage ./idna.nix {})
        (pkgs.callPackage ./urllib3.nix {})
    ];
}
