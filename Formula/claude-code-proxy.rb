class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.26/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "eb9aa139a2210180e695f007159e185228831df145f96e2c0c120114f026a03a"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.26/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "dfcb498e3036d11d87fded32fc6d29d0d4d727a3ee5bb6a98c42e954a87f479d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.26/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "ba58e705037507790f9417d6797ea443490e3582c0e48b6bb14870292bba7f44"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.26/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "6336fe33a51ee4a8b06f3624679abeebb56a87405f9a7b90eb6fba2dcb3562e0"
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
