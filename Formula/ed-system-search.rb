class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.1.tar.gz"
  sha256 "a8dc39db549d6bb61ccbd70792ec6be56902ad3e7c98d94a39757e6127a6f26e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.1"
    sha256 cellar: :any_skip_relocation, catalina:     "dc300249e05f216c37ae5eb4694d54bd678581b2557ff44d412dd4cac6474bf4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c874475eeb124d03e3935f17fa50894c9b7a30d5f1d42b74141714a4249ca469"
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
