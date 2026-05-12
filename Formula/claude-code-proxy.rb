class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.12/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "4137ca81c7ee5d6aee384617a32f5338a792f4e4db0ebc48d3bcc0babc37e34c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.12/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "e63a891cd99aa1bcee1f106903e81cbf3b53d930009b6a2a4f83158a517dfe5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.12/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "b9c3a08751d566c5bcd39205d0dec229ee21be9e2f27a75a5bce9fe96ece5520"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.12/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "0d4ea1f59cc8b78e9f011caefb8eb1c46434d0924384985fa6d2da43682dcc02"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
