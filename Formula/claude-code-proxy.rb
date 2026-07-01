class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.3/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "099a8e300c70e2b796f6616fd2ac098c1e4200842318e982a971eb645d8bf1ec"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.3/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "84bae81fec23cfb9ca9885657fff83ffd35b53804fb6cfa9ab7fef465d6f126c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.3/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "c5017279ecb1623c5631ed4acb2acc04d857b11d2af5af136f2aa35dbb2541fe"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.3/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "78ad03228e4176fb92d9a577e26551abda7e2cb77d75c100dc454c0eeca421b1"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
