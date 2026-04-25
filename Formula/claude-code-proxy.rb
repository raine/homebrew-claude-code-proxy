class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.7/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "fbd3fb3d49cb9159dabbb0fca7b3be5b356e2d3f013e923f2b6e2cba1cccbc3c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.7/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "05dc605208897743f93f11300b5fc92e08fe71da2d1dd213d17760506eab1032"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.7/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "9ca2f72aee4f79d37184b4351d28b6d3d00fc7669452313ecd59258e4bcfbec0"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.7/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "93de6d0eedf6d427094a103945a751da62530db5d01c1ae462bc3899341df475"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
