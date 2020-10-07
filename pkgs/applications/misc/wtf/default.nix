{ buildGoModule
, fetchFromGitHub
, lib
, makeWrapper
, ncurses
, stdenv
}:

buildGoModule rec {
  pname = "wtf";
  version = "0.32.0";

  src = fetchFromGitHub {
    owner = "wtfutil";
    repo = pname;
    rev = "v${version}";
    sha256 = "1055shnf716ga46wwcaffdpgc1glr8vrqrbs2sqbkr3wjan6n0nw";
   };

  vendorSha256 = if stdenv.isDarwin then
      "0p4cy7snxkx5in7c0nsy6bm0f1gn297rzwalm5rdfvhgdlb102nw"
    else
      "0l1q29mdb13ir7n1x65jfnrmy1lamlsa6hm2jagf6yjbm6wf1kw4";

  doCheck = false;

  buildFlagsArray = [ "-ldflags=-s -w -X main.version=${version}" ];

  subPackages = [ "." ];

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    mv "$out/bin/wtf" "$out/bin/wtfutil"
    wrapProgram "$out/bin/wtfutil" --prefix PATH : "${ncurses.dev}/bin"
  '';

  meta = with lib; {
    description = "The personal information dashboard for your terminal";
    homepage = "https://wtfutil.com/";
    license = licenses.mpl20;
    maintainers = with maintainers; [ kalbasit ];
    platforms = platforms.linux ++ platforms.darwin;
    broken = stdenv.isDarwin
  };
}
