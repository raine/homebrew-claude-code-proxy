class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.19/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "fd2b45bea4b17fc5cbf61117548c93076ae69be1b0994245bcf156189462d3f4"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.19/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "ff7abade5fde78e8e482c84b48e0b8deee963038c94ac170807b4258bef97a12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.19/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "0a5449aa67979ddd98279c261b2b9caa0d3dbbc639a14eeea6a9402d42dcb595"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.19/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "2b94a93a7d140cf597e7ad5d17a724a7fb549a98ae63ec0ecde783ebb93f9b6d"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
