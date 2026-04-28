class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.29/hopter-darwin-arm64"
      sha256 "1b5e46db78af3b5d18a8bbd0f03e8482db4a1a9bf8dab955fe9552427275ae0d"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.29/hopter-darwin-amd64"
      sha256 "03916d06de3e60951756995a640bb306c583bcad59fe85ebec524eabd06c8e73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.29/hopter-linux-arm64"
      sha256 "5e883f9945297cb205a31621f1c4bfa05db082c8aa46587d510c46fdd30758a3"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.29/hopter-linux-amd64"
      sha256 "f5340a9a4836966c185a69ac0b7233511735751343d123467fa6dde7a00c9ce4"
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
