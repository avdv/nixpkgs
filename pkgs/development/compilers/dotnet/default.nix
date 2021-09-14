/*
How to combine packages for use in development:
dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_2_2 sdk_3_0 sdk aspnetcore_2_1 ];

Hashes below are retrived from:
https://dotnet.microsoft.com/download/dotnet
*/
{ callPackage }:
let
  buildDotnet = attrs: callPackage (import ./build-dotnet.nix attrs) {};
  buildAspNetCore = attrs: buildDotnet (attrs // { type = "aspnetcore"; });
  buildNetCore = attrs: buildDotnet (attrs // { type = "netcore"; });
  buildNetCoreSdk = attrs: buildDotnet (attrs // { type = "sdk"; });
in
rec {
  combinePackages = attrs: callPackage (import ./combine-packages.nix attrs) {};

  # v2.1.22 (LTS)

  aspnetcore_2_1 = buildAspNetCore {
    version = "2.1.22";
    sha512 = {
      x86_64-linux = "27v3a69dgnnb4lz5p2dn2qwadb8vpnqwdy6mnnqfp1dl4kgg3izvriz2268if272sy6flcz5lckjlmn0i0i1jci5zypc7x9kykj991l";
      aarch64-linux = null; # no aarch64 version of this package is available
      x86_64-darwin = "0xh06jmzx2cfq51hv9l4h72hbfyh3r0wlla217821gi0hlw6xcc0gb3b4xmqcs240fllqnwrnrwz0axi3xi21wacgn3xbcmzpbi6jml";
    };
  };

  netcore_2_1 = buildNetCore {
    version = "2.1.22";
    sha512 = {
      x86_64-linux = "0c2b31l59izcxbhz5wzjpjkdl550s5p3aid4vyghq468vyf67pm0npjny50c172b63vw0ikfbps2b2hj16hpifp116gj4b5llmqjhyc";
      aarch64-linux = "3llai3d2xpgbr7a4ndg9wqfpnb5zb8k07dicc57a6cmniiqyqigyxinhpx2k0l45mbnihjsr5k1rih3r6bwlj241v67iwd2i0dpqd8a";
      x86_64-darwin = "106mx6a4rwcvq41v54c1yx89156s43n889im9g0q2pvm7054q8b6xm6qrnymzmj5i2i6awyk0z02j5pfiyh35sw9afxb3695ymsb3v8";
    };
  };

  sdk_2_1 = buildNetCoreSdk {
    version = "2.1.810";
    sha512 = {
      x86_64-linux = "388nrba5f7z9syq23xh3k45rzy3iys58s32ya7a0q9mwdf1y3haw7yvbq79cn08741hhqdi73mip8jf50f4s64mbr62ay1p76zsrkj5";
      aarch64-linux = "2vs8bhk63cjrqkm5n164ahc6bdz58aq9vmhaiyy27krp7wlkz4gpiva9153h7mywhk709l1qc7cddj99qsh2ygv6axjfigbhgrzslqi";
      x86_64-darwin = "3qxlgbd0np0w8wmp98mhp4cqgva4zglqf7k9kzqbwxfwr5s795kap7rs5w0cy7h0bsvj0ygx3d5nzyn9hp3fsswx4jl4mkvillnvjzy";
    };
  };

  # v2.2

  sdk_2_2 = throw "Dotnet SDK 2.2 is EOL, please use 3.1";

  # v3.0.2 (Maintenance)

  aspnetcore_3_0 = buildAspNetCore {
    version = "3.0.3";
    sha512 = {
      x86_64-linux = "342v6kxxbxky09d1c392vvr9rm30lf75wccka1bk2h4advlcga5nlgv93g7vrq48bsyxfi5gc36r3b0dlwl1g409g5mlk1042n6d0yq";
      aarch64-linux = "2xkg4q88q5jw6jdz6cxj8vsjr475nd0fcvifkv1shdm2j9dsjy233hwpxbr140m5n5ggyh6z99238z9j4kp2az977y8y8irz8m8ppvf";
      x86_64-darwin = "2p04j6p4j93pan71ih13hv57zxalcirh0n3vfjq0cfb80pbhf1f5cgxl24pw6kifh6hhh38rj62c4mr69lxzlqc8sfcfaws8dyz2avm";
    };
  };

  netcore_3_0 = buildNetCore {
    version = "3.0.3";
    sha512 = {
      x86_64-linux = "32ykpcw2xx708r2lxcwcbxnmy4sk159rlfjfvkw990qh7n79pm3lm2qwa3zhqcslznmpg18kwxz8qb5fgsa0h49g843xx4kyai0n7rx";
      aarch64-linux = "1lp8din7d5jv5fkyq1a7m01i1xg9jwpiljvam1kcyzsnwzvi0cb4ji336cfx4lqrn95gvc75gkzi6q8b4fz0h21gvk6z6kmlcr63nyg";
      x86_64-darwin = "0s20k7xawwd09xhy4xdcxp1rw6jd418ibrvhb509dnj480g48xryda2203g4mpswd24v2kx0n9qzxgbrbq9lvasfglkxi84bbqayp83";
    };
  };

  sdk_3_0 = buildNetCoreSdk {
    version = "3.0.103";
    sha512 = {
      x86_64-linux = "2diiplgxs92fkb6ym68b02d79z4qn63x5qlky5lvr757c1zkh0vfpk3khawdg94kdn4qkn6dmyqr0msxqgmiqyhp63cadzqq4vx7b12";
      aarch64-linux = "32843q2lj7dgciq62g9v1q31vwfjyv5vaxrz712d942mcg5lyzjygwri106bv4naq3a22131ldzwnsifbdn2vq1iz60raqdb7ss9vnf";
      x86_64-darwin = "3apswk2bhalgi0hm7h2j9p152jvp39h4xilxxzix5j1n36b442l1pwk7lj7019lxafjqkz5y850xkfcp14ks5wcvs33xs2c0aqwxvcn";
    };
  };

  # v3.1.1 (LTS)

  aspnetcore_3_1 = buildAspNetCore {
    version = "3.1.15";
    sha512 = {
      x86_64-linux = "f1bc75c3af3308dd4d1448570a85a2f5ab9d21df474965b7216452e9dccd6f10028c18e3e291864f8f19b18e1f203c80a9fdcacb303b5a5763d7579cdb014cfe";
      aarch64-linux = "574db7a64e6afe6e55dbc4f95b5d87bfde9cec973e9501f8b8ce6a11383edc97b600a3e926cda53a3711d2d7bc195dbe5d77ecb954c8d09a6b332b45c07e6512";
      x86_64-darwin = "973920703eb1ebe70279dbd78f5098f755753582504fe9fa55cf9d16d93f597ce464b741b13b5d6a3228f0a1a9a7e8303ec4f4d8f0c343dbf7ecca7abb45144d";
    };
  };

  netcore_3_1 = buildNetCore {
    version = "3.1.15";
    sha512 = {
      x86_64-linux = "0de999a51cdd53a2efa4ae3552834b540d59f598438675cb9b2ab1f16b41a64dbf0a25a2c8e65324bbdc594935046bc6ee32d8f8c25a95f607da2985f903ed55";
      aarch64-linux = "9b36ac1479808e486c56a0cf29ac334109cb77306dfe98c72eebbebf53cc34d1e22f404850a6da41bff0a8121781ca79bba23a9c5d82d024a2f4e6c3bff29f59";
      x86_64-darwin = "d77b57f9939707744af5bd854f9fa391bd8084beafdb7d609c85b5a9eb058521807627f0147e78329e86e00eec88440f6c806e5d0e319b0f8bfcbfb07821846c";
    };
  };

  sdk_3_1 = buildNetCoreSdk {
    version = "3.1.409";
    sha512 = {
      x86_64-linux = "63d24f1039f68abc46bf40a521f19720ca74a4d89a2b99d91dfd6216b43a81d74f672f74708efa6f6320058aa49bf13995638e3b8057efcfc84a2877527d56b6";
      aarch64-linux = "edc011e5ee64fc76e8004aa73d439e7cea922ab00be6c70250c5f73cf6838b1935f5d3d3c9aa65f83bfd3923751bc1a6d92be3fba64a0a09a4acb4fd8d6db4c7";
      x86_64-darwin = "b8cb6287a655e069311dce89e8eeee3b1ea953112856ce5a77731550c34d3f64625fb318bdb1257a78e0deb75a06f6d09835490aa8dc64249fad9b3a75ed438b";
    };
  };

  # v5.0.0

  aspnetcore_5_0 = buildAspNetCore {
    version = "5.0.9";
    sha512 = {
      x86_64-linux = "67ac99b8f631684961aa2e887ed5d6b9cc301b06a1842ac212791860bf6de145831228df5f57eca8a97e16e569e7b5a308fd20d82f11569c375c689fc932dfff";
      aarch64-linux = "7bad5fa5fb8dc7eba9babc06d68b170e127df8d5729adf26530b2858aa4f411ca35c4641da0b0b13c7340fc5843e3b1d70b2038eabfca64d598e06fcf1b47edb";
      x86_64-darwin = "422a509a36e91573a9c6122a08dcac40c8473cac5d5e5f3c6d8c66b50dab5a9d3713b8096314e1ac8c3fef67d4bd8082bbde2a3004df3caeac9b0b292714c8cb";
    };
  };

  net_5_0 = buildNetCore {
    version = "5.0.9";
    sha512 = {
      x86_64-linux = "454a11d87199be6fcd5f97f28b0f9c2f15c0288dd0759dc96ac2c730697b9e6514a19bbfc06185ccb4289dd11681ea5e9cfaf6f3676040e36d21e9b90282af8d";
      aarch64-linux = "00f33e9c7f6ab653872952a3bf97bd51f8c764abbcb472218d722f6d5593a80b94a15c1a6fdefd0a4f8ed64874754903c3ab40e1761cff93bcaff3b5da82c47b";
      x86_64-darwin = "4c3749fa0c64bed3ce1db05af3c98b2769b0d144977283fb887e9fa836fb6a7ec97e34591192c2c1fee3215b29e0f8e198e34a1b177c4e19ecb42743881ad819";
    };
  };

  sdk_5_0 = buildNetCoreSdk {
    version = "5.0.400";
    sha512 = {
      x86_64-linux = "4d1a92e0885ade03de0fdb41c27cfd948ab749a2f3e686c4a9dee314888c19d76efa6f8663a7aa7eb56cf36f508638c1a1f01c845d1acb19d8662d6ae365d572";
      aarch64-linux = "de0cf29ba176529c142c7538ce557b8af1ca978abe3cc6e079ed9cbc8adc41779ad7e28ed519b37e9b16f54381d94fd7842572b3629d65f5494f1ce7bb2a3810";
      x86_64-darwin = "8f4ad02e6e46f6dccdde18d06f41ab702f11833e76d2b0eadd245e22d9636ab49ee864b11e19bc1c20db00af58b60e0cfb6fb1e94f8cc18497c76a83d4aff3fc";
    };
  };
}
