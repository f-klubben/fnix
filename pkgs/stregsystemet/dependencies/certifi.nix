{pkgs}:

pkgs.python3Packages.buildPythonPackage {
    pname = "certifi";
    version = "2024.2.2";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ba/06/a07f096c664aeb9f01624f858c3add0a4e913d6c96257acb4fce61e7de14/certifi-2024.2.2-py3-none-any.whl";
        sha256 = "1lfds5aaf96aqr9gcmadx88s011vb4mywvhhyrlg62b1nw3kqf6w";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
