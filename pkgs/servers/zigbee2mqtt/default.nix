{ pkgs, stdenv, system, dataDir ? "/opt/zigbee2mqtt/data", nixosTests }:
let
  package = (import ./node.nix { inherit pkgs system; }).package;
in
package.override rec {
  version = "1.16.2";
  reconstructLock = true;

  src = pkgs.fetchFromGitHub {
    owner = "Koenkk";
    repo = "zigbee2mqtt";
    rev = version;
    sha256 = "0rpmm4pwm8s4i9fl26ql0czg5kijv42k9wwik7jb3ppi5jzxrakd";
  };

  passthru.tests.zigbee2mqtt = nixosTests.zigbee2mqtt;

  meta = with pkgs.lib; {
    description = "Zigbee to MQTT bridge using zigbee-shepherd";
    license = licenses.gpl3;
    homepage = https://github.com/Koenkk/zigbee2mqtt;
    maintainers = with maintainers; [ sweber ];
    platforms = platforms.linux;
  };
}
