class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.41/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "ba82a1a818f49ef8d0f7bccbbedee71985b55c43044a1f649970351cdceaa547"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.41/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "0e074ad941726c47cb4afd4aa9c8c3278da9b3fa2db0e3298857b5c5a81b29e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.41/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "57e6a28451253bcc1fef7b15b4d6978662711147ced61367d2377e4858022a5b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.41/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "4d4397ad9dec9dfde3fb448ac189af28b21bd857080aea21f878d72e007e0724"
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
