class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.13/hopter-darwin-arm64"
      sha256 "7569ee6190b9292d9252c777dac30c1403f0dedad5fd4640b8817af76271bb75"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.13/hopter-darwin-amd64"
      sha256 "b28e09db69b894bf4c44f91e494b7e3d93a054d7002f5ef49ce49bb5171096b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.13/hopter-linux-arm64"
      sha256 "0750e1963e267b3c748a8e6df41834ac26f8d3fd528f64e5f1a20b6013cba026"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.13/hopter-linux-amd64"
      sha256 "bfff9dc4f2ca32ac0363ed902f070c19e93c14a2a82ff34711e6033b6fd11843"
    end
  end

  def install
    source = Dir["hopter-*"].first
    bin.install source => "hopter"
  end

  service do
    run [opt_bin/"hopter", "serve"]
    keep_alive true
    log_path var/"log/hopter.log"
    error_log_path var/"log/hopter.err.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hopter version")
  end
end
