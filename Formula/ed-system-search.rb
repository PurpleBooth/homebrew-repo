class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.6.tar.gz"
  sha256 "fff1eb274099f0df16a9e6d8a8e19a94a3115375d72d10ec48b65074b8096669"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.6"
    sha256 cellar: :any_skip_relocation, catalina:     "1ca417a923ebacfe9054fccc18ad43a4dc7e362aefa0654e361b79ed22300b8d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "708d7225d80ba8917bc021fd696e8be7e52f935ac8783e59d45ef31919f7a392"
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
