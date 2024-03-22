{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "django-appconf";
    version = "1.0.6";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/c0/98/1cb3d9e8b1c6d0a74539b998474796fc5c0c0888b6201e5c95ba2f7a0677/django_appconf-1.0.6-py3-none-any.whl";
      sha256 = "14qrib4z8g7rqfj6826gf4g7m6hn2x5iii8j0j1yrxqzp8pl9bn3";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      (pkgs.callPackage ./django.nix {})
    ];
}
