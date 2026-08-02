class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.32/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "5396b1efd473713578632a23832aeed3c3dfd99ce55c2abad79786f5cc48d9e7"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.32/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "074ebb6c1a1cab1cb72f265b7f75846e3e0a55e23116bd741f652a0b1190982b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.32/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "be07689497efc3a212ef286b89d5d5884a4e1ebc14b2ede0d5ed019e3651b114"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.32/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "70b9d9d4d1e9110297d13e1d8a61e135e9a0f2393022c27732587dcea2f16a6f"
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
