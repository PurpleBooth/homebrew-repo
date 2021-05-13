class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "b08023c5907517d0552359acd22805bb36074b9dfd79cbe9c6e54ce5f972e138"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.3"
    sha256 cellar: :any_skip_relocation, catalina:     "580ad0bc6c9873b687a56a412bb6dba8f61c7134a9095018609863d6d1f109fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c82900c4f4d45380a90298d8301ffa8d18ca1f9497d7c0c5c908d4edb48eebb0"
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
