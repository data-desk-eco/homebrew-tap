class Delve < Formula
  desc "Local-LLM investigative research agent for OCCRP Aleph"
  homepage "https://github.com/data-desk-eco/delve"
  url "https://github.com/data-desk-eco/delve/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_AT_RELEASE"
  license "MIT"
  head "https://github.com/data-desk-eco/delve.git", branch: "main"

  depends_on "llama.cpp"
  depends_on "node"
  depends_on "uv"
  depends_on :macos
  depends_on arch: :arm64

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/delve"
  end

  def post_install
    system "npm", "install", "-g", "@mariozechner/pi"
  end

  def caveats
    <<~EOS
      To finish setup, run:

        delve init

      This will:
        - create an encrypted vault at ~/.delve/.vault.sparseimage
        - prompt for your Aleph URL and API key
        - download the default model (~12 GB)

      Requires an Apple Silicon Mac with at least 24 GB unified memory.
    EOS
  end

  test do
    assert_match "delve init", shell_output("#{bin}/delve --help")
  end
end
