class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.22/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "6c72720f373173875a21cf982753b174f0ff4e73570e7c833f5989c663cfc378"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.22/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "dbc64b17ee0971f0227c03d7d06115def34efa8862f392e461ea09a3f9209bb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.22/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "0b14044dc76844607b65cf00f137bf22a18600467baaa5ef5e54affd71ebe7d6"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.22/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b6ff5dab225ba36b8fd8668456d5310f7ea2dc55d95d25834a3f1468fbd72a07"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
