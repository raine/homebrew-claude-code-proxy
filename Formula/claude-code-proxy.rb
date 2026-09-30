class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.43/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "fe09abe377763167074013e6d56fa8091f14137bbadb8d62e7899bf3e8b659d1"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.43/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "bf8899fd436b7483896f18cd4d81f23b67c43c7c593c2a83795e14b809bf0d9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.43/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "2573c79f7b4c82905b05c1ffe986217a4ab0b669b62f658740d4a96cb4467f85"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.43/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "2d1c3d7f5dd7bc845b8b843c1375b52428c3b20cb0c03bb0283d11217aa4216e"
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
