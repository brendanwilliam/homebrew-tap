cask "clive" do
  version "1.0.1"
  sha256 "3caf9b1fd5432533d4335a76df942d1d6368c453fde1f74f8ef7ccf039f07fd4"

  url "https://github.com/brendanwilliam/clive/releases/download/v#{version}/clive.pkg",
      verified: "github.com/brendanwilliam/clive/"
  name "Clive"
  desc "Securely access a Mac terminal from an iPhone"
  homepage "https://github.com/brendanwilliam/clive"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

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
