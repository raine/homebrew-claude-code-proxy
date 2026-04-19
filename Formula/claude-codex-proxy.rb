class ClaudeCodexProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-codex-proxy"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.2/claude-codex-proxy-darwin-arm64.tar.gz"
      sha256 "272f4af014b3c86c8986a443111465304a671634a8a8b278ac5caa4c10f3c421"
    else
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.2/claude-codex-proxy-darwin-amd64.tar.gz"
      sha256 "24b14110d7142972db894185f03ee36225d59e96825b3598d6864c37cd4a3b2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.2/claude-codex-proxy-linux-arm64.tar.gz"
      sha256 "794cc0c1e1fb875307baa7625c71b4c6e8b37088cf4be9f844492958a4d737a6"
    else
      url "https://github.com/raine/claude-codex-proxy/releases/download/v0.0.2/claude-codex-proxy-linux-amd64.tar.gz"
      sha256 "666a07c900672acc28a171c592b74dd2ee02767372311e2999937cc7bedac2c8"
    end
  end

  def install
    bin.install "claude-codex-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-codex-proxy --version")
  end
end
