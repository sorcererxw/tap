class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.27/hopter-darwin-arm64"
      sha256 "2f0d2efa326c1c95b7cdac3fb1021829886c33c80c77441efd551be6a3944ec6"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.27/hopter-darwin-amd64"
      sha256 "d733fd1bddd5216868c2e0ba0e6c362230671721405224451088e380eb6671cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.27/hopter-linux-arm64"
      sha256 "e6882e111cae2141d028ae0e71a6a9f7ae4e260bcc2c9e1ae184ee7d1970b847"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.27/hopter-linux-amd64"
      sha256 "425e36b12e09078b21f35fb64bf77e6364db94ec527151ba452cc99d9083c138"
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
