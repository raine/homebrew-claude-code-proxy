class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.47/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "401aac79825628e5046ee8f4fd71d0168334e47d30f0f037d3376e1b433b428e"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.47/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "73df2ce418ed65c9570392e2d65cbf0eb1b11a39cf46ff19552067ad84a25ae6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.47/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "bf202a84cfb231a429c833fb08cf610e9db0f3e9c281d67f136601ab41cf8582"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.47/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "d204b14235f0fe74aa1b413c187f5895a36459d40a9e89aa6e74c9fc7c9d6914"
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
