class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.6/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a719673086bb17933f88b35219895a430ab597e208dd67dfc5491abc7902c0da"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.6/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "5e526af37e8db36e63be6cee83c194e9e51e6487d2a20fb54687725dd5dcaa00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.6/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "5141fcb50f287fdf2487a9078438107c9a4235f96b263166bdc958e3fad8f812"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.6/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "97149ed01871e52b48f76e9b546994fae8a2bcac18d01a21fce51c821f555af8"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
