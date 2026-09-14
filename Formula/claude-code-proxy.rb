class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.40/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "71b27147da03e77fac262bf2d3b002b4844319fdb157810ea810282939e9ae98"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.40/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "996df37baf4efafa8d0b0295092c15f04fa7f03679bc9bc439b4c3c29fb9358b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.40/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "ca7fbaa9fafbc8fc29e41ef5bd54eb87bbe372e07c9e7af97be1388fe82f4fa7"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.40/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "209a4c2f50794a9dcbcc55f0bee2d025ce9fbaf635d1927eedc940677560a484"
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
