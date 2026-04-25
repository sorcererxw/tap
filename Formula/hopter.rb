class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.20/hopter-darwin-arm64"
      sha256 "993b988e107f9dbd39d727f06248097447270bc73a5be415d5f6e69808bfbac5"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.20/hopter-darwin-amd64"
      sha256 "bec345115c403dea947bc83dd5967847ba1596463efad39b9f178b3279711878"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.20/hopter-linux-arm64"
      sha256 "a65d128b4f574f6729afb3497980dc2738581c58fa33a801993abbad2da88893"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.20/hopter-linux-amd64"
      sha256 "8bdbab01e9cfcc6874cc9b47ef8cdf81557483c8edfeccffc69c2377e9579213"
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
