class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.16/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "ea167f4a613cc407849a3cae675948eef305c757fc45ee18df4d4a31eb0d4b82"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.16/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "90b48989d25407aa0394ed527d00bbb13460e9e7dc188f9a6a6d43a7a7a1f973"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.16/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4e0dd880d22f806f9d17face6cca910551be552e3961db8a13fc3cd18c7105b7"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.16/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "60440bfe230413bb3fcfbd9fc80f772d325fa9479311e00f1b20e29b4163707e"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
