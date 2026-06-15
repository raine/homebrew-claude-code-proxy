class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.20/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "3c1d5e0f21ee4d3234e5d0237bff7e2498f333ad6617f273a6cd7b12514ea75f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.20/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "72989d5df156af8afd039ca53a759a07692b98c36755b7f9e20346c896a2a0ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.20/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6d01a0863fb05567c36e8ed760deeef5cd7c8765250700bdf98827bab2f0b945"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.20/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "bcd3d2759e6386f7186f92446607b67443ff64a6bd47ade84fe4946fe0586b21"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
