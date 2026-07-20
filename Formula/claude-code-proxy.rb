class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.22/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "2d15554ab590a469b52808d34a4ca380976cbe896c18ed1a7a379c06ba6f30d8"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.22/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "2fae3364d45e980be412cbdbe9cf71a68124f151e0f6b7c63f83d0b19f983bf1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.22/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "433abd3b342d46ca889af2cf163f1e5c51c85f1c626ac958e9229a22f8f9ee8f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.22/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f63fd9ba1dcb96ff13382a9d549764550fb90bf4cb75685ada9948c716dcf70d"
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
