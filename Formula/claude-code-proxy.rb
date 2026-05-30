class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.14/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "92969625fb229aa521f52291eae7e41b5d331970edbf6621a7535356017b633a"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.14/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "0733630dbfe3ad5e5595be1598c08059ebc53752191f1bae5db639c54bd7ca7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.14/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "0199f0450d6be92b2fb81b66d8c858d20d5b0ade3f8c68ba6ce3bb51cba6cb44"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.14/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "c5daca4af228ae95f96363155bfe23c3c6fcbfcfc2da407a2c1ed27e205059d4"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
