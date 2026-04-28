class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.30/hopter-darwin-arm64"
      sha256 "a26c7cbae118e33f7fa91208313f077847080c69d0f1b99c986d4e750e00ac33"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.30/hopter-darwin-amd64"
      sha256 "78210e8e499190c3a14cc738d5c5f7db31cccb0f1b0f6bf7b187e441590f05f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.30/hopter-linux-arm64"
      sha256 "8d887555b692dcf6aee9219c9d9afe105a948f35ae56f22af170079126b8aab9"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.30/hopter-linux-amd64"
      sha256 "755512c929533b9fa801541c5dbaada3d73aa1ca11107671101de0f7246029c7"
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
