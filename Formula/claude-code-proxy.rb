class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.11/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "c63635939791e1f88c8c4006c5faa69fd933b060e7fc3111b0eea26078dece7d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.11/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "0adf6bdb1d0b0c8179e2c44e83d7860a462144e3cd4455f810099c7aab3338e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.11/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "7e9a7adc2c819b513dbb65b3f9ec89e2bd673e0ee3cdeb4fafffafe65a2afef6"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.11/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b612ff1c99e3dbec6cbe28abcc3a9a50c80c0b637a5983055b73e573ec6b76a5"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
