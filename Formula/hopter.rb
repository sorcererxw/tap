class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.18/hopter-darwin-arm64"
      sha256 "ac2a089502a991a01d5ae1db4d417441dab5c34b02ff7f8516cf7d5ebf77b1c9"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.18/hopter-darwin-amd64"
      sha256 "e51805a1ab91255fef14f627331254f26613d2d043e043fefc37a92c08de19d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.18/hopter-linux-arm64"
      sha256 "8972fe19c291bcea3ac1f30f29e8b7d4cdb932028193f97a769b42db4b3261be"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.18/hopter-linux-amd64"
      sha256 "3fb4d5837bc52db09c8d6fce3d60dcfdbd5c271710bc692da734df37fc6a7b7f"
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
