class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.26/hopter-darwin-arm64"
      sha256 "787417ed6b7571e110e2cd9a01db9a1506fef3ad992c6d8145c48d79d2043171"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.26/hopter-darwin-amd64"
      sha256 "fef98e86f495b4e181c8689bdb064fe5fd3ec1548ac6f676e3d50337af9f38fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.26/hopter-linux-arm64"
      sha256 "08286e214e4c5f9b73ddb530da5433e0308094ddde03fab2b230b7b1ef7cd2a5"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.26/hopter-linux-amd64"
      sha256 "b7e0e03cfdc1384704c4612e985c008bd3afcaa76335047d753d3515b76efb1b"
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
