class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.46/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "23f92d9b6977f9f15edc018c28b24759d6639ba480d6a901445c6d5fe3cdd15b"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.46/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "e530bf923632ca7145e1821e19b9c0638b60aed494a9a90885beecbc41f7452a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.46/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "4d0770f7b267dab0e4a25dbfea87f8184002cdce82033e4a74fbf4dcb5bc9913"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.46/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "14bc2532ede702af2772d586951c024d8f1bfcd4ec6b38cc7dbcfaa3bff0a8bd"
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
