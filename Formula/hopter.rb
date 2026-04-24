class Hopter < Formula
  desc "Self-hosted remote control plane for local coding agents"
  homepage "https://github.com/sorcererxw/hopter"
  license "Apache-2.0"
  version "0.0.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.17/hopter-darwin-arm64"
      sha256 "2a2ec53315009f6b1cfa06bb5031c488b074d4e931d5f2dd4b863d276ff8efc4"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.17/hopter-darwin-amd64"
      sha256 "0d8f33f263c9a0303b76e74e1338486cff4e33922acd9e56e7d59f03544f584f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.17/hopter-linux-arm64"
      sha256 "99341f8f8eb47f8f675bfaa2c713d02aa22d09910a229fb8fbf51a795e5843b1"
    else
      url "https://github.com/sorcererxw/hopter/releases/download/v0.0.17/hopter-linux-amd64"
      sha256 "e6d910c6c5bc93d989caef900d7a5fde75f0b07c779db7dbd1cad89e1bbc6ca7"
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
