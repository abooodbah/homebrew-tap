cask "leanmark" do
  version "0.5.0"
  sha256 "daafa4c2508bd7a395a3c538b3e881b466c9a94c6e1bd196ec67e86c037ece04"

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
