class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.10/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "f20625900220b50be559fd3d39083f1c249d541ff64aeb8d0b41b3091ac5cf53"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.10/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "5e548814a3682f3396fe47e610eb89a9744a4d1dc54b8494fbb8bf388e25ea7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.10/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "5095f582fc919e6131869717aea370c7e8e453b01f36ea71a3f95cdae07b451a"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.10/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "37240054f1a6fc7573c5af293868edb47cadad6f9ebd28ff5fd6d399b611a8f2"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
