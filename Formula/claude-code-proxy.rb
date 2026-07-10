class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.9/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a8dc4d51ba89dabcda2e7d3aafcab8be8db8597ed9e37f6678d7003132d54d5a"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.9/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "d79a87de526a72991d72263a96a1d4806f6f12f186339dd6e7cd33f0d2b48b3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.9/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "e8e26fd0df0e8c58dba58603ee2f36dc274b407b4f43588576611bd486637986"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.9/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b522e3e1e5275f11a4b0879f6097530a2b6851861cb47d0954a36ef3901da374"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
