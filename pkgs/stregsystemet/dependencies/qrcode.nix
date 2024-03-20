{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "qrcode";
    version = "6.1";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/42/87/4a3a77e59ab7493d64da1f69bf1c2e899a4cf81e51b2baa855e8cc8115be/qrcode-6.1-py2.py3-none-any.whl";
        sha256 = "1xbcc3l4q5rlbzrc7y99svax9xhgk214qw030s8k55f31xbfx5ir";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
        (pkgs.callPackage ./six.nix {})
    ];
}
