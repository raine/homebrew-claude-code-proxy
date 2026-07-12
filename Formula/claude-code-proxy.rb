class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.14/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "c3cbfefe9ee6745750e0a007783b3a91e35b82576e0ffff3945d5b9fa9eb71e8"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.14/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "c7d073234fa996b14cc0fa9f0fe5a9925f4f905425b7225c3073f280ab7e811f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.14/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "80651a58fb7dc2d6434defa5284fff13854301beb10616e36bc12a2b5cb58abf"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.14/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f843a807e32eb897bc20c1f6ad8a10c121d4a06f0e5521616af345a92b85c7a4"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
