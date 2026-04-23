class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.12/hopter-darwin-arm64"
      sha256 "0a18d5677f22ca176ba7b6667f8720faadb01ebcf86b68007779e83d6cd40bfa"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.12/hopter-darwin-amd64"
      sha256 "98782b8308d18b16fdf91631625f762e4530b44eb71761f8aef02e9ed346b141"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.12/hopter-linux-arm64"
      sha256 "7cdd7bdf07bae8c86da44fef947005564ec27eb799e69a46c275ee2279966063"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.12/hopter-linux-amd64"
      sha256 "9f3f1ff08bb61f6079de6b5a8d006482493ac47370bf663d488f9597737a4050"
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
