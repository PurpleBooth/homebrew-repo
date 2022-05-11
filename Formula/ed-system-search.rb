class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.46.tar.gz"
  sha256 "8c1ec6fbaa409de0deab0f570ff81ce5307ef4ecd6205f435f510749b8648f51"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.46"
    sha256 cellar: :any_skip_relocation, big_sur:      "6274204f9bb1bbe09dd5bb44b5adcf881311b212e870cdacfb1b8cdb9c4e43c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d818f8d60fb52333a916eb8a81d55bed231b822126f19417fc6624c7f8fad25"
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
