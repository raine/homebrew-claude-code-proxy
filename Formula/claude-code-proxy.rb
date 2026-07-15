class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.21/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "12c340342f0dcd476a29041272eb65476c5d73054f00c9bba1ca9300020cf267"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.21/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "1b4a1259dc74da299ee2cd72832f7b18cd5b82dc056cb19cd21fd940ebd6bf1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.21/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "18b15eccca713eafb07f2016f4b4ec939684b8ff92aa69a37200d0afb828a59c"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.21/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "f27f01aeec673f33a1f8690137e4f736d96e66f23f7578f778083585bf486fe1"
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
