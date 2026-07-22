class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.23/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "6caa8642a7b86ac8ecfbe480a534f28433b8dc66b331b80592bc9b4960dbd945"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.23/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "2210cd4831f9f83e1b21c082a384dd77cc333c967ae83687648b2282d1ac15de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.23/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "e819f290f6233491af25d1efb70bd59b6cb902aef97e0cc880ad3853d0a6122b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.23/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "377740a55449207c942b0819b987ca29e8894aab8aae82f104f8c4ab5f40c440"
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
