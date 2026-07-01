class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.4/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "ec0b3ae82a82dc842e37426513de15cfe6ccf89241584b6f62a507d9d6aa0261"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.4/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "db50c21de9be5f5e075e4099ae018386451ece7abe56720228b650eaa177fb26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.4/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "e9638274b55b0e7626e2da308dfd0da487a211676e8e0d3a061a2e966f09f775"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.4/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "526c2f92fa4b44265cab9a65bcd32b8c6634305797994a705ed3066ec4e896dd"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
