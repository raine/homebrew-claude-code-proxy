class ClaudeCodeProxy < Formula
  desc "Local proxy: Claude Code to ChatGPT subscription via Codex Responses API"
  homepage "https://github.com/raine/claude-code-proxy"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.24/claude-code-proxy-darwin-arm64.tar.gz"
      sha256 "d9f29d85a8e95ec790de13ae44dd96193364c9793bc994fa22a62c07db516b55"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.24/claude-code-proxy-darwin-amd64.tar.gz"
      sha256 "ee0519ced56548d9b726582872944880c2149916f0206a133a45d6b19ea41a78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.24/claude-code-proxy-linux-arm64.tar.gz"
      sha256 "de7f6dfd1473372be2a8b6cb6a5a62e5070c96ef3369ec80182041c5bafad532"
    else
      url "https://github.com/raine/claude-code-proxy/releases/download/v0.1.24/claude-code-proxy-linux-amd64.tar.gz"
      sha256 "652a8fe67ce3ddeee98fb274a3dbb5d090c6d2a2f12cb05927f4b23105f07238"
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
