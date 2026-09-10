class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.39/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "77b89c95adb798785d9a681f9e30384187023dd8f179b9600c4f5a47f26edaaf"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.39/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "42f7b60ea7183d9d126a4b93fd4bb67ba99c39c4c3c9da9e1a32d9c32dadeab4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.39/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "42ecfed462556aaefa0ae2412aafbea0644ddbe498c538ed90157b99cce7bfba"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.39/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "508b7ce93354fcc454495543747f8d8197b92430011890128b5b151ec1a26092"
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
