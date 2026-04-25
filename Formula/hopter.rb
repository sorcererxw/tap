class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.21/hopter-darwin-arm64"
      sha256 "cfc6c12f18cff8bd022f6618309cc48b6ab292719bad0a4b6f059b4ad251351c"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.21/hopter-darwin-amd64"
      sha256 "31134f985383dd390460de38aba696b3a06c88834dc2aae1995c0c873f39027c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.21/hopter-linux-arm64"
      sha256 "2e77cf928f17218648847141bb26a0d30938e05b08e5559ed0c5bdcbc4bfe96f"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.21/hopter-linux-amd64"
      sha256 "a420f5477864a49d06949722719b11936e0ac28d29aa689d51821ec050b9bbbb"
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
