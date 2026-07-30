class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.29/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "47e81ae7060d85f208530dbe20b887551509f2f24336889276578df57f4d7fe6"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.29/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "d750667c89db4c0b2c2ccdb1305b3af46483f92566dc09d3e51a677f94d656ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.29/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "a3fa12c7fb68d646881db720f4826fb7cfc81e62ef60151066c4d0a4b2a998fc"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.29/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "41ec322333177e95239752ecf4ec0ed3252e061a34f7a2cda14b505c3ff372d5"
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
