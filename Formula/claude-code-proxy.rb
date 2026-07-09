class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.8/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "8b3e8b58984ee3088ad8dfd29cea213f8b019bc05cd52fc8f0c70b7fa0f2a846"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.8/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "deed2164a935c54b1a808e6c9a4c83a912833da32ba137123d9827649d83d071"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.8/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "14b5a2a4e8fe403ba9b22b4e7f6231249d9473c420eb874970c627073be8f4a1"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.8/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "bb2b0a838fa70032258ba8c09db2fb44b3a48d433d04464b90cd799e293dbdae"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
