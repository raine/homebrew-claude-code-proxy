class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.18/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "06434902712df5a02f81be4346080f3e8ec44215722a17b57f474d7a0acfb368"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.18/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "3662c9130c1b8f7b92b0068b53fd3ccf09580e6c31a8929a220279d425abc66b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.18/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4cba874deedb90959965d6b41630fdeb25c7c140df8a00ac4d8f3f52f0142dd7"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.18/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b855ffabdae17935b9905c2a8606587a16586e0276f853ed743246edeb820a8a"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
