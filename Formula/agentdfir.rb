# Homebrew formula template for AgentDFIR. Rendered by scripts/update-tap.sh
# into efij/homebrew-agentdfir:Formula/agentdfir.rb on every release.
class Agentdfir < Formula
  desc "Digital forensics and incident response for AI coding agents"
  homepage "https://github.com/efij/AgentDFIR"
  url "https://github.com/efij/AgentDFIR/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "abaae4124f322dbcdf65f81008e4b3ecfc368e5bb88491e39d2541a4bc2e0aa8"
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
