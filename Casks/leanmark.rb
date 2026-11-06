cask "leanmark" do
  version "0.7.0"
  sha256 "fe887b76d2dda188734f1f30d84e06b17f1d1fa2d7dc573b4f648c712514d21d"

  url "https://github.com/abooodbah/leanmark/releases/download/v#{version}/LeanMark-v#{version}-macos-universal-preview.zip"
  name "LeanMark"
  desc "Read-only Markdown and Mermaid viewer"
  homepage "https://github.com/abooodbah/leanmark"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "LeanMark.app"

  zap trash: [
    "~/Library/Caches/io.github.abooodbah.LeanMark",
    "~/Library/HTTPStorages/io.github.abooodbah.LeanMark",
    "~/Library/Preferences/io.github.abooodbah.LeanMark.plist",
    "~/Library/Saved Application State/io.github.abooodbah.LeanMark.savedState",
    "~/Library/WebKit/io.github.abooodbah.LeanMark",
  ]

  caveats <<~EOS
    LeanMark is ad-hoc signed and not notarized by Apple, so macOS blocks
    the first launch with a message that it cannot verify the app.
    To allow this one app:
      1. Open LeanMark once and close the message (Done or Cancel).
      2. Open System Settings > Privacy & Security, find the LeanMark
         message under Security, and click Open Anyway.
      3. Confirm with your password. Later launches open normally.
    Do not turn off Gatekeeper for the whole system.
  EOS
end
