class Sift < Formula
  include Language::Python::Virtualenv

  desc "Investigative research agent for OCCRP Aleph (local or hosted LLM)"
  homepage "https://github.com/data-desk-eco/sift"
  license "MIT"
  head "https://github.com/data-desk-eco/sift.git", branch: "main"

  depends_on "python@3.13"
  depends_on "node"
  depends_on :macos
  depends_on arch: :arm64
  # llama.cpp is installed lazily by `sift init` if the user picks the local
  # backend — colleagues who pick a hosted endpoint (LM Studio, Ollama,
  # OpenAI, etc.) don't need it.

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install "click>=8.1"
    venv.pip_install "requests>=2.31"
    venv.pip_install_and_link buildpath
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
    assert_match "sift", shell_output("#{bin}/sift --help")
  end
end
