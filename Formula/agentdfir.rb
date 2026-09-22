# Homebrew formula template for AgentDFIR. Rendered by scripts/update-tap.sh
# into efij/homebrew-agentdfir:Formula/agentdfir.rb on every release.
class Agentdfir < Formula
  desc "Digital forensics and incident response for AI coding agents"
  homepage "https://github.com/efij/AgentDFIR"
  url "https://github.com/efij/AgentDFIR/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "fff33116356d77b928460d4c0faadd417e0d90598a8cbce3035491a5a3ea0a52"
  license "MIT"
  head "https://github.com/efij/AgentDFIR.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/efij/AgentDFIR/internal/version.Version=v2.0.0"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agentdfir"
  end

  test do
    assert_match "agentdfir v2.0.0", shell_output("#{bin}/agentdfir version")
  end
end
