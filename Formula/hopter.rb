class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.8/hopter-darwin-arm64"
      sha256 "1949c19c3a501db89cdedaf78ba32947b9fb649abc53731a775ddfd9b6873d08"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.8/hopter-darwin-amd64"
      sha256 "595fa4b9877dfe7a04065d67b48931b292548a0e8072c34d4c9af8be01cb32e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.8/hopter-linux-arm64"
      sha256 "05d23203f9c07ee30ad142131f823e650efddcea47cfc890777872d0d25a5024"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.8/hopter-linux-amd64"
      sha256 "6d82da1a81c91b743b7f0a22f56168f8aa882eb383984337f617d03cda35683d"
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
