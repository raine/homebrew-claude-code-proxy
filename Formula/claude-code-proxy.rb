class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.3/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "d5a24472b4aca52c417c368affb9ba0b0efccc8ddcc79bd013101b4eeae755b2"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.3/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "09fc977ac083a863be4ec6aefcaa4c80ed5f7d8a2e04057948175548c4f88414"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.3/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "ef397c0ca06beff983e9e4a2079e73815ce88eb765221d5a1e41b3ecdd217628"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.0.3/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "b1c8b32bf87b46fc60263a4961103cd42d38e32c6b7ec3b5c37b6795262a9253"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
