cask "sift" do
  version "0.1.0"
  sha256 "0481229cddf9a72986310f2da7d6fa35036e3f717b0db22a85e7e1ba93ee0b0b"

  url "https://github.com/data-desk-eco/sift/releases/download/v#{version}/Sift-v#{version}.zip"
  name "Sift"
  desc "Investigate subjects in Aleph or OpenAleph from your Mac"
  homepage "https://github.com/data-desk-eco/sift"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64
  # llama.cpp powers the local LLM backend; node hosts the bundled
  # pi agent harness. Both are runtime requirements for `sift auto`.
  depends_on formula: ["llama.cpp", "node"]

  app "Sift.app"
  binary "#{appdir}/Sift.app/Contents/Resources/bin/sift"

  zap trash: [
    "~/.sift",
    "~/Library/Application Support/Sift",
  ]

  caveats <<~EOS
    Sift stores its encrypted vault, models, and run state under ~/.sift/.
    Run `sift init` once to create the vault and set credentials, then
    `sift auto "investigate <subject>"` to start an investigation.

    The menu bar app launches automatically when you start a session.
  EOS
end
