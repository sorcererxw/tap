class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.16/hopter-darwin-arm64"
      sha256 "6b1a8e470a576fbe84a42accd8a45a612c7af461e73b2719fa9651eef0e25d93"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.16/hopter-darwin-amd64"
      sha256 "93ad4082591ea325b68b4428d5d38be8bdd4814a493503d4e1a67bedfee8cda0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.16/hopter-linux-arm64"
      sha256 "1cb8e0bd317126ea11f22fc03ef1255de9d2da39c40a4521a81af65d939e4972"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.16/hopter-linux-amd64"
      sha256 "1b3afef4535dcab7c9505a6de2fd78a86cfa41c236ce31070815f059dfa09677"
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
