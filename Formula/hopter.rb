class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.31/hopter-darwin-arm64"
      sha256 "4b72508b01d38225278d4a24f9136c6f4882a21710e3553e8f27f16a2c5dfff5"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.31/hopter-darwin-amd64"
      sha256 "f96e80a0083e3940a0be7531ae029a1cad5f33e3c4f960955adf72f6539aeeca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.31/hopter-linux-arm64"
      sha256 "3d4e416085b9659364fb5f01c6234eb29116475ecfb30dda18aa46874735d9fd"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.31/hopter-linux-amd64"
      sha256 "826e47157b216f33bb3c938b8ee95f1be8be297c2f408c21ed34e9fb22ccb4b2"
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
