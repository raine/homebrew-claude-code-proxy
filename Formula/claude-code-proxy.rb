class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.1/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "0e24a68822862ad3d0ccd4b299c3cf5186bc1e8f2c2122e627ea80847d6e7f76"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.1/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "ccba1ab76a8e17d5f11b7cb5a8ffde6b13983ec597326d2e335c7e579e55987b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.1/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "80ea37e616c640bbf7adc6a42a3354b512c663c4b416864153d57cf936784b2f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.1/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f099d44a9e42c645b781155e975d431ced2ad158b324412e78e5c1e682d42369"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
