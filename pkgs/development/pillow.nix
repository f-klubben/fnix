{
    pkgs ? import <nixpkgs> {},
    ...
}:
let py = pkgs.python3Packages;

in pkgs.python3Packages.buildPythonPackage {
    pname = "Pillow";
    name = "Pillow";
    version = "8.3.2";
    format = "pyproject";
    src = pkgs.fetchPypi {
        pname = "Pillow";
        version = "8.3.2";
        sha256 = "sha256-3ePz7Y0AxyYxvBnL//itO2IVBipe7UAjga02X4LwwYw=";
    };
    propagatedBuildInputs = with pkgs; [
        py.defusedxml
        py.olefile
        freetype
        libjpeg
        zlib
        libtiff
        libwebp
        libxcrypt
        tcl
        lcms2
        tk
        xorg.libX11
        py.setuptools
    ];
}
