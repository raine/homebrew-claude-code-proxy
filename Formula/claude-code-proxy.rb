class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.5/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "dd20c65db34591935a51410659eb5b724f18f7a4862a0260a790b4ea448fadee"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.5/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "39edde9f6b5886971c42c9b8147da667ec8980273892868f6a8811d82564c3df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.5/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "5baf304bedbf2101785df8c7d225469d9da03b64110206a7171be045c9600d9f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.5/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "68b8f8808c287eead274d8c10ad53560a10022f14a550fb65977778e856d7f72"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
