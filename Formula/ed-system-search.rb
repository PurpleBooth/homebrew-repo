class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "98bafa7609c012e64612d2d1f593983091b15f079132deea5e0a6338d512687f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.2"
    sha256 cellar: :any_skip_relocation, catalina:     "e5a6ad345ec8ceaab000325aad5fcff5d78f1db7d952f0f22ad038ba16a6fb0b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "257fe1457ed4f0363814ae3d4feaa11bfcfa449dcae65862db98649a1b966541"
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
