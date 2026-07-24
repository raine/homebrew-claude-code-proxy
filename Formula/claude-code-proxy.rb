class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.25/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "8f12924eb090d92b75a080c7d4a7be2743d07a7c94d2eb05d36eafea54d39988"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.25/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "cea5e8836ca0d4096f133cf18dc9e96fbb90f4cefdef5fee17a5b17b1321c6d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.25/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "78694d98c85c6cc0e24e4b8bc90db6bba0f2d1e6d35327d377f6db0208c5066d"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.25/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "87d07bd4d993e6ee0f353b3489fb88cff646c44b139fd2af327226bdfe15f4e0"
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
