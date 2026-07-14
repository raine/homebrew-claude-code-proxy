class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.18/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "a7137ad524b11f31d80888132a6c013a120c6941b21fe21511093d8bb2cd0b27"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.18/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "9f2333bd1763e70004210e26adc3c7f8a8e8d5176a4fa6c2f88d6acede268837"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.18/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "7a7b278e2bd0d049d81732161d2acef17e9c254ceefc828b8a2e481c00c512d3"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.18/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "fa614330f120f657b23ac5b59351341ccc915dc18bdfeeba97a3bf1141f46163"
    end
  end

  def install
    bin.install "claude-code-proxy"
  end

  service do
    state_home = ENV.fetch("XDG_STATE_HOME", "#{Dir.home}/.local/state")

    run [opt_bin/"claude-code-proxy", "serve", "--no-monitor"]
    keep_alive true
    environment_variables XDG_STATE_HOME: state_home
    log_path "#{state_home}/claude-code-proxy/service.log"
    error_log_path "#{state_home}/claude-code-proxy/service.log"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/claude-code-proxy --version")
  end
end
