class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.9/hopter-darwin-arm64"
      sha256 "1a329ba7808970920d9e9918ce3840f328860c883abeaf5812f054dda8bb73fe"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.9/hopter-darwin-amd64"
      sha256 "8455c1ad25d2d87d56ded0a01d19f020c2376a519ba88789b8c7e9c1e87d4557"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.9/hopter-linux-arm64"
      sha256 "69f187cc9931c4ab60af205b03f3d03e2ee738514cad10aafbf1a24005c351ae"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.9/hopter-linux-amd64"
      sha256 "0978c31de3b8a1fc4e75756c02aedf349ad2c8f1518dad447e61c112f127c124"
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
