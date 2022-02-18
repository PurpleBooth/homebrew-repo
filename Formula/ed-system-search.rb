class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.27.tar.gz"
  sha256 "3b7c394b3c5540e1a679e627d17bec67474156fd5c1708fb731e5cee09307f1b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.27"
    sha256 cellar: :any_skip_relocation, big_sur:      "730c324f081846397c15b66e93ef5c9f0f07f54618c034f678b8de718d336bae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7665c0ace9d71209bf928ec5710e8ffec273d79b80a7cb25b7723159efa6fe4"
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
