class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.16/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "e9e662c37750363937e180cb35bdb3f57bea4ca672450d1902e72200c0d5de09"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.16/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "c2be59619ff1c3975cc2230c45612ef2f2478d4b69adddede63b710ae7f1f005"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.16/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "1413ad977207e0f45e4bc3c10f63df7e1bd97f31d7dee77bfa48a9d075b76357"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.16/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "481e2c129a2398e8851e81e4d05eb73f4a3c8b8c9bf9a646a03d1d35627ef688"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
