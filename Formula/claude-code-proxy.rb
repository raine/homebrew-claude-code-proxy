class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.9/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "792449ca703fa27456bbc64c2a1f8b06be69f0a726caffec3ced9f9d26becd9d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.9/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "910bf7bdc570d022c2af5f3c48131864902b8e6ed0b45073844602e6578eb0d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.9/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "56a4df4ede7a4978a3aa3cf058c9df582fde33eba50c47d30ba00220c6ad8901"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.9/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "0805722bb70f1c2306db747787e1b71c795d902c0a26efddefba1a0638dd6c46"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
