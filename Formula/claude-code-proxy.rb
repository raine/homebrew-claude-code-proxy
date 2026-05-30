class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.15/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "1dec7b4230c7408f7fb29fa0d172c61c3c0a1bfb9b5dbcf0e9aa9668e01b6e50"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.15/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "0bf10ac4d3a85b00bf92125d359f4c07b8323d90281d14f87a28bfb866213907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.15/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "64b49f32a362d84ca135401a4c3472fbdfa7c39ca1bb8237120b0530464c7986"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.15/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "1a8dca896df5ff7264257b531fc6124eee4d592903190ac11a9eac8287859f58"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
