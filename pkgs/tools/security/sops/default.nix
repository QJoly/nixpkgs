{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "sops";
  version = "3.8.0";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "mozilla";
    repo = pname;
    sha256 = "sha256-nUeygUZdtDyYGW3hZdxBHSUxYILJcHoIIYRpoxkAlI4=";
  };

  vendorSha256 = "sha256-/fh6pQ7u1icIYGM4gJHXyDNQlAbLnVluw5icovBMZ5k=";

  ldflags = [ "-s" "-w" ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/mozilla/sops";
    description = "Mozilla sops (Secrets OPerationS) is an editor of encrypted files";
    changelog = "https://github.com/mozilla/sops/raw/v${version}/CHANGELOG.rst";
    maintainers = with maintainers; [ marsam qjoly ];
    license = licenses.mpl20;
  };
}
