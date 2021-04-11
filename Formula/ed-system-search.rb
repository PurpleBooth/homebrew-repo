class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "6cf52c63e53accf899bd11b1b0c3c10d67088628cc5a2e5c807b013e6a4535a4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.8.0"
    sha256 cellar: :any_skip_relocation, catalina:     "1e40b75975ca431d1ff3601cc67a07355e78d61c969f1ee202f66406eba1bb96"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fcf0be942a57c355205178f535ed80f1bb7d8d95ee9af952fb4a2f6fc62eae9e"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
