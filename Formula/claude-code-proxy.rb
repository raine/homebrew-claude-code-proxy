class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.13/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "221ea0b7d694be70ed961e08f80cd277f4c4ef35460f29a4f4a31014459dff4d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.13/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "4b402f1912735791bb3535b644717cd5e5090ab0d02b4c7abcd8019c4add2c9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.13/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "73db6f40d113e59a9a49610da38398be1633e79bbe7c8e3d5e02de5ca1ec1fab"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.13/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "065135809f243eb2cd5e2f1bbe993356c4d04e53a9d97f0c9def352319a76562"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
