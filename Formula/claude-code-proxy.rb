class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.7/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "2e8ec54e75d7998a7676f2f112765c4e9c9e5b3d5b065a9aa4ba79a72f698ede"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.7/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "c99d9ea93f177294c74af463c0f5359c3fdef7665fb89ead35ad38a26d116d79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.7/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "d2021164513bfaa8ee813fe4f62bda090013ab671e84ed3b316e701478f3dbdc"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.7/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f2fa6385a6e4e83ab8d0fd26c83f67a0a64a2e0908e3dced171006af28a9362a"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
