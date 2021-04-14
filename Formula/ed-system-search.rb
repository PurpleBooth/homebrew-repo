class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.5.tar.gz"
  sha256 "045242dc208f5ac8515acebc231749fe2fc43bd109172da8f7fffd8f1876c63b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.5"
    sha256 cellar: :any_skip_relocation, catalina:     "e242508adb8f58bef7c25c62a114934105ab65b4951013bd201bb4b9fda1f9fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "de9a4b2dcf5253230f19ba21c69ef4a712cc3f337b230f54b51d3a16d25a8910"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
