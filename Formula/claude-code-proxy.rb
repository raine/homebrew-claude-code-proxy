class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.4/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "c712590cc2b4e26739bae8823272e8a384150285ac2dd9650f088795dea18609"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.4/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "eb3c63a7374f4ff9327eb8bdcd0476dc09bf72ee65d445116c492c280dc680e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.4/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4692296be13e1fc0fddee400b0767fff006640a7a416864c05176c95f2bb80a7"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.4/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "d20fa04182a590d970552ff693085d6bba7aded61c6b649fd53240d2f0870f8b"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
