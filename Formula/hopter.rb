class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.14/hopter-darwin-arm64"
      sha256 "7b050a89f0af27b5165d585b8d4c0c1476eb393a3c51a5ef1a9432a75a38cc3f"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.14/hopter-darwin-amd64"
      sha256 "5e18b07b45844c2b48206b30ac58678e1bb9c46999223b362481fcac96b58f07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.14/hopter-linux-arm64"
      sha256 "cb5a14c51482958631e15289e10f6ca639ddeba977b60c1e36dd663cd8c48fd1"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.14/hopter-linux-amd64"
      sha256 "3c1deef19411d84ad5c8af4a10803e3be8d48155e9dcb79b3e7dc654c7175da3"
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
