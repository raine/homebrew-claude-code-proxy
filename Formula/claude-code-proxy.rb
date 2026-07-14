class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.19/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "7a915b57817d9331cc60a612959103fcfa5fe13c5a9ac9342e8ebaf8b6406e6f"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.19/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "9bba0502f3bcf336fd4a35048fa78417fe4e755f4f6a1f8da6dd11aaaeaba406"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.19/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "0edef42dcf2de00f079ce3a0c78d641922aacda4d31ead6e57b5d2046b31ce36"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.19/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "5f883da493c5887bc60682ee6f00a7d5e9f8733277f19fe8f71010e0731c06f2"
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
