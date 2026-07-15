class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.20/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "fe378014026f7b59e5f5fabbca8281d87488d243072e6d221ac20ed696aa6b5a"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.20/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "cd50c32bbeb33b9c7b0248325bb1b9bcbfb7ed88a803f0088631f197f9140e3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.20/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4d56f31ffff151d9715ba7b7c37df49373d0e065b5027c6dcee1bb777933d912"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.20/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "dd2d10cf24039c32513254ebcc1f7721094862382568d7ae6b09d2562c2894a5"
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
