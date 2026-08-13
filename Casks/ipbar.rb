# The template CI renders into edcs/homebrew-tap when a release is tagged.
#
# 0.1.0 and b9f7e8b1c7a750d2c4c755faa1fb354ddfe3757abb932d35b7afd4fc861bf493 are filled in by .github/workflows/release.yml from
# the tag and the zip it built, so this is never edited by hand and the cask
# cannot drift from the app it installs.
#
# homebrew-cask proper has notability requirements, roughly 30+ stars or forks,
# so submitting upstream is a later milestone.
cask "ipbar" do
  version "0.1.0"
  sha256 "b9f7e8b1c7a750d2c4c755faa1fb354ddfe3757abb932d35b7afd4fc861bf493"

  url "https://github.com/edcs/ipbar/releases/download/v#{version}/IPBar-#{version}.zip"
  name "IPBar"
  desc "Menu bar IP address display with named addresses and VPN state"
  homepage "https://github.com/edcs/ipbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "IPBar.app"

  zap trash: [
    "~/Library/Preferences/dev.ecs.IPBar.plist",
  ]
end
