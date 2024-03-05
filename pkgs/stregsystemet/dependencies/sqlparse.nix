{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "sqlparse";
    version = "0.4.4";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/98/5a/66d7c9305baa9f11857f247d4ba761402cea75db6058ff850ed7128957b7/sqlparse-0.4.4-py3-none-any.whl";
      sha256 = "1wr8km6wq36jxl63aanzgm5qhhca6ghwdvzicqzgkl675bza8c2l";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
