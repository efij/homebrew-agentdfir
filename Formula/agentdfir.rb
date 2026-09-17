# Homebrew formula template for AgentDFIR. Rendered by scripts/update-tap.sh
# into efij/homebrew-agentdfir:Formula/agentdfir.rb on every release.
class Agentdfir < Formula
  desc "Digital forensics and incident response for AI coding agents"
  homepage "https://github.com/efij/AgentDFIR"
  url "https://github.com/efij/AgentDFIR/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a3067badb1829314993b3030e8863ec9e140b9a27f8f2ef88dba2e91b2973289"
  license "MIT"
  head "https://github.com/efij/AgentDFIR.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/efij/AgentDFIR/internal/version.Version=v1.0.0"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agentdfir"
  end

  test do
    assert_match "agentdfir v1.0.0", shell_output("#{bin}/agentdfir version")
  end
end
