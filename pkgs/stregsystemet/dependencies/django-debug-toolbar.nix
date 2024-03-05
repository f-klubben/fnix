{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "django-debug-toolbar";
    version = "1.11.1";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/6f/66/21218e91f67d1e005388b1c87ae3283cd7b7835145c72f5efe721b51c628/django_debug_toolbar-1.11.1-py2.py3-none-any.whl";
        sha256 = "0pkkap5p21s5f3x3wapcl9qr3ya6hpl9w469g1yjpc63v8bha91d";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
        (pkgs.callPackage ./django.nix {})
        (pkgs.callPackage ./sqlparse.nix {})
    ];
}
