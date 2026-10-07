class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.44/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "40128019c015820bd3fc771f49804544cf6a7113297234d580580add00297b6c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.44/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "a105f4acbf9d97375a79352b6a984f1faf4cde7e991a8687d7f8b3af9cb159ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.44/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "13135df46ddc42ca769000a479d04a9a393095d228f68909613d43970eb1a361"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.44/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "15d53746991328477458673c17329481e2a321f2e89589f3d681ee6b7b145e1a"
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
