class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.24/hopter-darwin-arm64"
      sha256 "a3826e1989573e3c800c35b86a712c59c793e79d2c8fdbd4f26284e857dc2c00"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.24/hopter-darwin-amd64"
      sha256 "0d5efe2367b2e1f7e87d87d37619fdfec0a0fe082dde48a010b9ba1a5274e9e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.24/hopter-linux-arm64"
      sha256 "4647203c030b2300ecd52ee7d383054aa304804dfe8fe012b70ac8a12f59f93d"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.24/hopter-linux-amd64"
      sha256 "a1c7fbcfd908737293d876016080291bae68bfdb4d3f139b3b3720b6283c8efe"
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
