class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.11/hopter-darwin-arm64"
      sha256 "38852a701a0123f07c7cda9abe3449c4d71f6bf409297586ee1ecccb03987b97"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.11/hopter-darwin-amd64"
      sha256 "f76afd8eb5fc6cf0c714502454c5fca3d8062a7e0b1d751989b640c869918c65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.11/hopter-linux-arm64"
      sha256 "50c14a3e81783e1bb95b9c85fcfe052310eb606ad71a96a5560026be0cd0b08a"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.11/hopter-linux-amd64"
      sha256 "d97dc98ee9eaae9334165276afbb4f6f2d993e9470a5c1f17b94c33a70e5af58"
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
