class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.6/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a54228f4a092454a2fd8b5898fd058260236ed9114ef4a62f56508ed8d85e86c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.6/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "82ac640e930131a3cf59c4da1a86122041f8c53e7c9653f309316b84b0375ee5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.6/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6d54499f7b2254058bc41d27bcd9057d0598e1f558581131eb5d297485e278cd"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.6/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "ccfb64ed7fcdc8abbda84beca0ccf6af8fa6d037327c9288f073594f279cb5b5"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
