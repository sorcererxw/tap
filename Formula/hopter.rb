class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.6/hopter-darwin-arm64"
      sha256 "f0fc7a9f38049e69c4fafb824119b304c65c2ce87b124e3726d453046d823294"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.6/hopter-darwin-amd64"
      sha256 "98c2da1cd7bb99d72234f25701b47ff4c6409bb8b7768f61d81950c6a5b1b6d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.6/hopter-linux-arm64"
      sha256 "fccd6b3e13c255c3c78bf3f27eb5370276e5c48955254baaa8512bd981cab9d2"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.6/hopter-linux-amd64"
      sha256 "59d939d696b48e0de204b47578d78869abce0e8c3669582e090b39c192b2b38a"
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
