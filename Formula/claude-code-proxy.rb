class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.17/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "547ca330f3ee553ab697d695fb7117a12ab1b63ae629287c30b8c7cd4baca329"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.17/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "070149ecffedd0e5efeba4a7aa2b7a60fd0b0bf479484990647b0f172a86f7d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.17/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "76c3c28e044fd779655f57be1048924330492fb5eb65cdabaa21d3fa8543d139"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.17/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "24057ea37c4ad386f0a0e3d257dc9b734d220f717fbd57114dc003a61e4a79be"
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
