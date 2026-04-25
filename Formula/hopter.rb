class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.22/hopter-darwin-arm64"
      sha256 "06e6e5878015b82b63a7c723d69252b07ad98c55079e1c7b9e658b68e35af097"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.22/hopter-darwin-amd64"
      sha256 "51a3800e70a5f683e037c647710089dca2a375236865b494e1f4058cdf6e2ba6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.22/hopter-linux-arm64"
      sha256 "833e6e4e5d52dc2c8581b2897bc12cbd58ff8f9e6972b52069190a18590a3280"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.22/hopter-linux-amd64"
      sha256 "6de51d866c41c7bc8251719dc4464c3cdaf400ccb0d2f5399856f6875aab9b4f"
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
