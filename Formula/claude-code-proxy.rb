class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.10/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a9b740107f67a7afe87e006d3b9960df82772449c555fa393a69a301ac1ba161"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.10/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "8c3086a26ca9cd9adc8e138492f27d04523f69a9a5af357325707b08d931f6e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.10/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "35cd6987ff19aa01bc6fbac5d0857b99f9131088a9df23b93217efbbb8a1d473"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.10/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "76359a175dd5b018b81d95f42e50c5d52fba589b316756c7f9747fff04bb5e81"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
