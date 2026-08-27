cask "clive" do
  version "1.1.0"
  sha256 "4c5079f6e6f8c41d7281ee8b198cc13407e68c58db77dfa0c8f5ea964af13dab"

  url "https://github.com/brendanwilliam/clive/releases/download/v#{version}/clive.pkg"
  name "Clive"
  desc "Securely access a Mac terminal from an iPhone"
  homepage "https://github.com/brendanwilliam/clive"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  pkg "clive.pkg"

  uninstall pkgutil: "com.clive.pkg",
            delete: [
              "/Applications/Clive.app",
              "/usr/local/bin/clive",
            ]

  # Keep paired-device state on ordinary uninstall. `brew uninstall --zap` is the
  # explicit opt-in path for removing this user-scoped state.
  zap trash: "~/Library/Application Support/clive"
end
