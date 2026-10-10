class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.45/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "c132f6e6a149cd5d366d09830aff97d5224b69e740b176b0f5a878a3b4fc23b9"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.45/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "f154931e99a9061f350e9805fadce6ff2b59a902ee9c1bae2ae1c787371ccd69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.45/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "6c7bbc6b137e9e4e4784b8ff9813a7aa191582e653422966ac1eb77d606ed5f2"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.45/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "71a600ff337061742bf5cee1c795f81025b91ebef097ecf5d496e8979c102d27"
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
