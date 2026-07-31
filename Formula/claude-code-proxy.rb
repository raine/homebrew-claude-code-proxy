class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.30/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "23732b1a189db57ce24fd80e0f181a1c199fbba17542cd02008f02fb09630d32"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.30/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "f01d686da6ae899adf9887744ad8d72fc231d0b17b789d2ded3ac52f4a192059"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.30/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "8f2bee78372740001ded4346284ea0a43b48f3eddcbd76412cc29916c9b9361c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.30/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "afa08d97141be5003b3abcbfa482f58e9c119c128ef955f92776816dbcae96a0"
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
