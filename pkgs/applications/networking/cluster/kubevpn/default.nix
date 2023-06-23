{ lib, buildGoModule, fetchFromGitHub }:

let
  pname = "kubevpn";
  version = "1.1.33";
in
buildGoModule {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "KubeNetworks";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Rceh3h/vk1J56MaAmbLRDaq6ISspF9RGzqSLysuo/h0=";
    fetchSubmodules = true;
  };

  vendorSha256 = "sha256-JqMj57zsj7679cFHc2M8fS/L8jgdGMPgLl2ZHcVNlwA=";

  subPackages = [
    "cmd/kubevpn/"
  ];

  meta = with lib; {
    homepage = "https://github.com/ledgerwatch/erigon/";
    description = "Ethereum node implementation focused on scalability and modularity";
    license = with licenses; [ lgpl3Plus gpl3Plus ];
    maintainers = with maintainers; [ d-xo happysalada ];
  };
}
