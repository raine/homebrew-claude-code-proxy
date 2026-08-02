class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.31/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "7a91d0ed3a91bde5ec31fe9bb2e71ad20b9f5ef8cb8ad772f4d2367129c2fba2"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.31/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "c03625816eca23f71e786dbf0d4705822d54cd30aa0deb503ba9b777972909ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.31/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "1627b10088ba9b543714dc25f1bf6e50447299b130cc5539f69e978e69fbb12b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.31/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f416c1d0cfc01a001931df7d8ecf1ba4e93f36411208a6875aa2513cf882a277"
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
