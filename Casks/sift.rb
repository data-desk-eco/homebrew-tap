cask "sift" do
  version "0.1.1"
  sha256 "8b9408e5d8c3beb1f682832225e3eb85c149dc11abd8763d877774ccb7e58b3d"

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

  # Sift.app is ad-hoc signed (no paid Apple Developer ID), so Gatekeeper
  # would otherwise block the first launch with "Apple could not verify…".
  # Stripping the quarantine xattr brew applied on download lets the menu
  # bar app open silently. The ad-hoc signature is still checked at launch,
  # so post-install tampering is still detected.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sift.app"]
  end

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
