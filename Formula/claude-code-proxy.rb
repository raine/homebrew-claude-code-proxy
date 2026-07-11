class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.11/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "dd85176036680eba45f32b797d9066d543bfe87d898661312933dcb8705bd3eb"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.11/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "deac6f9bcbb1f33e0cb965adc7b04dbba17fe5f6c6cc10e50d842e51292d738b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.11/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "cd36455e91cfff3b178b0c729973d689f907233cf646dd94e77d456a9a3e8e9b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.11/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "736db4c9ae36cd6d973adc1c1bd3f9694e285b01cb3f8500b9129f196fafa23b"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
