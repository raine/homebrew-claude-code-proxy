class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.27/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "58bdf230b32dfd86b3470c69dab1c17d858d8263c0512b7305308760bf883a8d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.27/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "821c2d92705ccb1790acb044f71399ef4051088855fd1e7cf3e543330670456f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.27/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6137730930a8335875b1c324c09cc0da77dbd21113b42aabe9fb651c09c3cbe9"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.27/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "2170473e338ce0585071c43c3e36aa5bda49f1ed342333452aba5cacba7ce964"
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
