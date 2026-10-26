# abooodbah/homebrew-tap

Homebrew casks for the macOS builds of
[LeanMark](https://github.com/abooodbah/leanmark) and
[LeanDoc](https://github.com/abooodbah/leandoc).

## Install

```sh
brew install --cask abooodbah/tap/leanmark
brew install --cask abooodbah/tap/leandoc
```

Installing by the full name trusts only that cask, which Homebrew 6 and later
require for casks outside Homebrew's own taps. To install by the short name
instead, run `brew tap abooodbah/tap` and `brew trust --cask abooodbah/tap/leanmark`
first.

Both apps need macOS 12 Monterey or later. The download is one universal app
that runs natively on Apple silicon and Intel Macs.

## First launch

The macOS builds are previews. They are ad-hoc signed and not notarized by
Apple, so Gatekeeper blocks the first launch and says it cannot verify the
app. To allow the one app:

1. Open the app once and close the message (Done or Cancel).
2. Open System Settings > Privacy & Security. Under Security, find the message
   about the app and click Open Anyway.
3. Confirm with your password. Later launches open normally.

On macOS 12, the same button is in System Preferences > Security & Privacy >
General. You do not need to turn off Gatekeeper for the whole system, and you
should not. Environments that only allow notarized apps cannot run these
previews.

This is also why the casks live here and not in Homebrew's main cask
repository: since September 2026 that repository only accepts apps that pass
Gatekeeper, which means a Developer ID signature and Apple notarization.

## Update and remove

```sh
brew upgrade --cask leanmark leandoc
brew uninstall --cask leanmark
brew uninstall --cask --zap leanmark   # also removes settings and caches
```

The apps do not update themselves. `brew upgrade` installs a new release once
the cask in this tap is updated.

## Checks

Every push runs `brew style`, `brew audit --cask --online`, an install, a
launch and quit check, and an uninstall on an Apple silicon runner (macos-14)
and an Intel runner (macos-15-intel). See `.github/workflows/tests.yml`.

## Updating a cask

1. Set `version` to the new release.
2. Set `sha256` to the value in the release's `.sha256` asset.
3. Run `brew style --fix` and `brew audit --cask --online` on the cask.
