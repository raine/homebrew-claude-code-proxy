class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.28/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "4b4511e2605e952053fb7ab75e8093fffce1f31f1ec238abc70e4c0ebdc62eb9"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.28/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "b1ab158490d96709fa6faca4239fce0f1e27f1dc94018f0bf24d67c4a6f6021a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.28/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "9e93a069ec98dc00741d1ff0ac81385a39241bc96ec6962c30a1aef6ecb1b04b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.28/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "8dbf0a2b8ec16539511c5ed134bff137e76496c3df09d879855895c0f3ee0f38"
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
