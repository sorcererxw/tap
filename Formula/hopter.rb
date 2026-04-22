class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.10/hopter-darwin-arm64"
      sha256 "af2cad57dd8feadec25a22312551ce3db0a98d7757fed6e195129db528bf53ce"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.10/hopter-darwin-amd64"
      sha256 "9fb4425ec53320821ddf410e409014b7f0a651c3fda10b652f7a8d980af74e00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.10/hopter-linux-arm64"
      sha256 "ba5f42cd532a32074ffd2c5866fa23e79cc94d219d06d789e25aa45604b131d2"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.10/hopter-linux-amd64"
      sha256 "b1b2d42245c87eafd9b6d6febae43ae2b368bfd6bb4e326e78e33f9a773ef219"
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
