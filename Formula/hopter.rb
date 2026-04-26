class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.23/hopter-darwin-arm64"
      sha256 "fa1905672c795ce5301c1417a6b0d50861125460c5834a62bd1f0d4576d9cb9b"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.23/hopter-darwin-amd64"
      sha256 "87ff474ec1e87bd60c202557fe233c86e76ad4fd0171764686a7a58fb3dddf81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.23/hopter-linux-arm64"
      sha256 "b12744094642e0bffb5c2ac2b46365284f0d40e4392af51b8d9de06dddce9055"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.23/hopter-linux-amd64"
      sha256 "529435b0bfae038e4b10ed9d236541e94125bc05ceab77760a8995782fce7b8a"
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
