class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "6e1fd37a6d08e07d8a52fa2536864b62b73c265145e93106e56af5187b12168d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.1"
    sha256 cellar: :any_skip_relocation, catalina:     "9f00dd56d9dbbecd5fddb5f6b0c41801a78fc593d29da97b563701f9a0ffbc62"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bab4674c3da1bc845110fb7c89f189808c74ce38a6bbfd0c87f6776dc650eccb"
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
