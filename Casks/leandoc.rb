cask "leandoc" do
  version "0.1.4"
  sha256 "e09ca49e2aea89b77166687430297b7c917b05938e36572a221aac604a176a65"

  url "https://github.com/abooodbah/leandoc/releases/download/v#{version}/LeanDoc-v#{version}-macos-universal-preview.zip"
  name "LeanDoc"
  desc "Read-only viewer for Word documents"
  homepage "https://github.com/abooodbah/leandoc"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "LeanDoc.app"

  zap trash: [
    "~/Library/Caches/io.github.abooodbah.LeanDoc",
    "~/Library/HTTPStorages/io.github.abooodbah.LeanDoc",
    "~/Library/Preferences/io.github.abooodbah.LeanDoc.plist",
    "~/Library/Saved Application State/io.github.abooodbah.LeanDoc.savedState",
    "~/Library/WebKit/io.github.abooodbah.LeanDoc",
  ]

  caveats <<~EOS
    LeanDoc is ad-hoc signed and not notarized by Apple, so macOS blocks
    the first launch with a message that it cannot verify the app.
    To allow this one app:
      1. Open LeanDoc once and close the message (Done or Cancel).
      2. Open System Settings > Privacy & Security, find the LeanDoc
         message under Security, and click Open Anyway.
      3. Confirm with your password. Later launches open normally.
    Do not turn off Gatekeeper for the whole system.
  EOS
end
