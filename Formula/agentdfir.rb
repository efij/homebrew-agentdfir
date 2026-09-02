# Homebrew formula template for AgentDFIR. Rendered by scripts/update-tap.sh
# into efij/homebrew-agentdfir:Formula/agentdfir.rb on every release.
class Agentdfir < Formula
  desc "Digital forensics and incident response for AI coding agents"
  homepage "https://github.com/efij/AgentDFIR"
  url "https://github.com/efij/AgentDFIR/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "ac94385b78570b19dfc59fce04d395abdeceac9d837183829e03d379901b3230"
  license "MIT"
  head "https://github.com/efij/AgentDFIR.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/efij/AgentDFIR/internal/version.Version=v0.12.1"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agentdfir"
  end

  test do
    assert_match "agentdfir v0.12.1", shell_output("#{bin}/agentdfir version")
  end
end
