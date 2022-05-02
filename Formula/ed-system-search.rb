class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.44.tar.gz"
  sha256 "0af3840a82c8000f6dffb3b9ad46831ae3699d920444ebd2cedfb4899e2a1d46"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.44"
    sha256 cellar: :any_skip_relocation, big_sur:      "a736a5a1917156d0f72cbe521770e40ff92cefb34b59361cb278dead041257d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c427dd672b0e88b61dce6f7479f83f0a7fb8dd7d225f06c3364bdf2bf083746b"
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
