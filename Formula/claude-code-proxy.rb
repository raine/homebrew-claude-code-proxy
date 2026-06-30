class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.2/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "09052d1f7ee7699b442189760c019564ef07b8438e221e549bd04ddf3662237c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.2/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "31dad127486f0c843b0cd6e4ffff1a5c8297f213568895b8d2e49ae6d9f90991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.2/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "1afa6dd5b948f6c1a8cbe4ec04f5f85b05e6f7398d23a37200e8c74ed389a38e"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.2/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b41a02b2be5d7529dd730a8338958430c20991f7a4a04dbaeee1e2b08b0eba5e"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
