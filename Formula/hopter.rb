class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.28/hopter-darwin-arm64"
      sha256 "1d6276dc984391c53831d8a1899da7aa6f4994250c1162230ed57c6a328c8574"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.28/hopter-darwin-amd64"
      sha256 "f164d8a155211f156716fb233fc9df153d9f8d59e1e7263ee49d9e7561cda762"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.28/hopter-linux-arm64"
      sha256 "9ebb2d6583564d408061e8d6097ce00a48e7e275f498a4253c279931a145f469"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.28/hopter-linux-amd64"
      sha256 "533fd8b9cd8a3e143395c3991354f1d68661079b7e65627b61eb2ccccfa3bbb4"
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
