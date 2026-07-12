class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.12/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "9d2b0975147973594c00cf8f6819c265ee6acdffea9dfa62e12a96915f44b227"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.12/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "d367c0c6f3f5b38140244c3c4abb360d01a3cb05924493b5a287bb2a7993bcc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.12/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "3b4130fef7cbe52f566ec4b613280d98250c26f1e1a31954aa74b210e864f28f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.12/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "a23c3fe214d0859c1d3d797a28ee4eed74dfe1c85e5e3d1249adb69192425d59"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
