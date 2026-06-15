class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.21/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "6aae7df10a17a980f7b079d540e2cc1a9721a1c00186853b08b99be357c6f1ca"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.21/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "a6a6c3828d8b34db6cced059c2582e03fea289037d0c8a246edcab34ef081658"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.21/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6a5baf79908d2f1353fcd09c685fbbf8829e49f3b6e60c5ee6865d762315f6e3"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.21/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "a0a6fd14ef5e04b8a6872faa5988ad71f3d0be84c56c4cdcc87a88c50a72ac79"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
