class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.15/hopter-darwin-arm64"
      sha256 "6fb01d6bef44ff5f255128b6553048c04ab7e0ee5628d1b57fdf5f44cde336d9"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.15/hopter-darwin-amd64"
      sha256 "8cb8c94c5498b0aa9def0f9977bf3eccda6d30bbb6f4bac377203633818778db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.15/hopter-linux-arm64"
      sha256 "e0b7c40c91e9bcc9a7e2867185e6de46ed526aa5ac4ca10d4a1bbfe173d88204"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.15/hopter-linux-amd64"
      sha256 "dbd9641a7e3565bf3b75b2a39b803e426b459c3515e86a863454d091b4fd21c5"
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
