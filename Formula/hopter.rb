class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.19/hopter-darwin-arm64"
      sha256 "9d04fb9bc2ccd2189a9743416b997656dc2c3311091bd3642144e3437045ad26"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.19/hopter-darwin-amd64"
      sha256 "02c7c15121c9bc27049f45f5f44e1fe96b4c3e2635ca4d83acfd2975933ec44f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.19/hopter-linux-arm64"
      sha256 "3f309e76e9b7af7763d25bee94ac7a0594a2efdcfef3b548878b9ec0f0d2881f"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.19/hopter-linux-amd64"
      sha256 "50be0c1013782d000029f1d9010816ebb0c7d16d5cbbd41e41a93944e35cfa80"
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
