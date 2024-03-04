{pkgs ? import <nixpkgs> {}, ...}:

pkgs.python3Packages.buildPythonPackage {
    pname = "qrcode";
    name = "qrcode";
    version = "6.1";
    src = pkgs.fetchPypi {
        pname = "qrcode";
        version = "6.1";
        sha256 = "sha256-UFJThU9gfyq/TRYJLGHU6dURo7Q5LmC/+VemhZKwQ2k=";  
    };
    doCheck = false;
}
