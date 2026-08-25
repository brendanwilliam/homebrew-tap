cask "clive" do
  version "1.0.3"
  sha256 "e63155a0fe476bc579daff1c4b66e3beaa1584245107b87b4a01757a226fcc7a"

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
