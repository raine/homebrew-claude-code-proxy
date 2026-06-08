class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.17/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a3030e641cbf3aa6a3994af453684260e1356d977a67f67062add65a47ce753d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.17/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "da454153d24c4942d7a73d316a7829f10a7fe5044a752bf9080800636359f028"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.17/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4573e3514586628b2583458e35cbfc02e6f91db9bece10bdea45fbe459acc2cd"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.17/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b2ced09aaf6aa187832dd862e35206d56c1ede82bc2579c8612546aec18a230a"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
