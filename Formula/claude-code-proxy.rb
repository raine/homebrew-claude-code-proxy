class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.13/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "de9de16ea991a3d4ec9d52e4f13961a1ee8c58df1ba77d1d4292b1ec7af0ea78"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.13/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "51908158d49d2becafc491964d8eec542c233aa934311925fe8609aa002fd589"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.13/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "e532041eb1496a47fd598cbe2d417f920b08ff2e2bb05f33e15679a10f47eda3"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.13/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "3052d24bda3ba5f7f9bc06566093990291d735d4d055a37c3c85420be5cc774f"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
