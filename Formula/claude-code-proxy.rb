class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.42/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "97542c34398db90227210c6feb6de864c80f92e7a16379024340b2f50f14b696"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.42/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "e4bdd6f0b9478f30c914947ae7a75db9b25c6d05efbd9b2cd2fc012a83866ce7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.42/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "ed731a16c2fc32035a5cc40432b308b52a9f97d79c05d6ed0ad658e7a855af9f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.42/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "86a6713e952d6809ff220e27fb5ef07505cc25806df86e9dcd389fbb643bc587"
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
