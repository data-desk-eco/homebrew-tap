class Sift < Formula
  desc "Investigative research agent for OCCRP Aleph (local or hosted LLM)"
  homepage "https://github.com/data-desk-eco/sift"
  url "https://github.com/data-desk-eco/sift/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_AT_RELEASE"
  license "MIT"
  head "https://github.com/data-desk-eco/sift.git", branch: "main"

  depends_on "node"
  depends_on "uv"
  depends_on :macos
  depends_on arch: :arm64
  # llama.cpp is installed lazily by `sift init` if the user picks the local
  # backend — colleagues who pick a hosted endpoint (LM Studio, Ollama,
  # OpenAI, etc.) don't need it.

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sift"
  end

  def post_install
    system "npm", "install", "-g", "@mariozechner/pi"
  end

  def caveats
    <<~EOS
      To finish setup, run:

        sift init

      It will create an encrypted vault, prompt for your Aleph credentials,
      and ask whether you want a local LLM (~12 GB download via llama.cpp,
      best for ≥24 GB Apple Silicon) or a hosted OpenAI-compatible endpoint
      (LM Studio, Ollama, OpenAI, etc.).
    EOS
  end

  test do
    assert_match "sift init", shell_output("#{bin}/sift --help")
  end
end
