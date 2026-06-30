class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.0/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "b9dd2b4e65c6949c17eb35c85dd67c8331169969a28241e2dd41c3032be26570"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.0/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "6c4b1a782c2472fe70d00b4e108d777adb3fd8b461f6bbf0312537a7d6515749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.0/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "edb661fa8e48651226a60048f28b96dccf37b8a6c14f5d5856085bbebd9cf546"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.0/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "0be1a99756973eefb9626329fcb2c48723ed5079a9198cef35d5c488bf9246f6"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
