class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.15/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "ee092085d01976f431fc636f787e56fdb7ba24e218263e911be727aefe6745e1"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.15/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "158d78ed88bb833a0799953b5b3f5427c6d5a7b5f7d05e4a7862c34ecfb7c096"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.15/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "5cea4c61bb9d718e503154e43aced489021b130a637c2c7032ce4c59f0ffcb46"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.15/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "30876dd85df0fc35c0d46e2f0547941d638c50fdd6bf25e2da7a960468816804"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
