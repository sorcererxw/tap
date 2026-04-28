class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.32/hopter-darwin-arm64"
      sha256 "8a8e56dd7ebbd4136655aaa38b8fe604f0699997a6c8418c2625b7d8a71ac288"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.32/hopter-darwin-amd64"
      sha256 "c78f53d712db00900b43bbd3cf33879b89aebb8fb5047120281a7d3ca1f85a0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.32/hopter-linux-arm64"
      sha256 "227047a8fcd42ac122efd463e5b3e1fc0d53af3cab41df2e43e8d8f4eedf1555"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.32/hopter-linux-amd64"
      sha256 "7ca15663d688202695eb691df0bac2af61e504d881feb14d8b937328b11c3892"
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
