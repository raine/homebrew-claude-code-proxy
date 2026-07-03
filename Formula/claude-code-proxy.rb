class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.5/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "20d397f0230a2ea8d3d0399727abbbd1c0a0de948958bc0eb3dba409ff062696"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.5/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "987e2cf2d48e7cb42cee76918dc3d9ebf04f5c4837f8c6c4cf2384f99bb95cc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.5/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "90bd432275e575a3c39387eebb00e97657e8cdcdb4b7476e43d90d05f747326d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.5/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "e497686ec1c8be86ea4e61c50cbc28159a379179e51272ea4641f02ee78d8a81"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
