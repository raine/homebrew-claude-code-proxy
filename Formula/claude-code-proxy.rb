class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.8/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "d176515c4bff9ad6bb363630561fcb2aa40fe28a9f3d5d82ce9cb8721b8cd198"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.8/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "485b4f63c3245ee3e71cbc382995ca326391ec56278e0fe65d6228bc5cf5d540"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.8/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6c88b2e0fff3364e9bc5ef783850fdb453735dc048b6b730052143d598770769"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.8/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "3139be42832840c087bab058a1a66eb5e44868dfc13c9b04b11d145ab085507b"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
