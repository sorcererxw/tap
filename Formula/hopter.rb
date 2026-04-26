class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.25/hopter-darwin-arm64"
      sha256 "fa879d4b0e3adc897303f09bc09e74dc1cea4a08939edffc5997b774a6cca70d"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.25/hopter-darwin-amd64"
      sha256 "1e0bd0d40df6da13b97a4024125a446e400680207a18191423548353741be934"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.25/hopter-linux-arm64"
      sha256 "b14b430528b5641c40919b35874f915431f3d09da87ed2a5ca54e6e1698f456a"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.25/hopter-linux-amd64"
      sha256 "106bcff6e4fff533965dda67d1903e4852a099fe704573e34069240fa76b88b3"
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
