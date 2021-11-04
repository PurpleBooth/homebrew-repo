class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.18.tar.gz"
  sha256 "7d9799bfacf0be29219d67b5f8cfbffee769b4f9291e879ed63691716f5ce7d9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.18"
    sha256 cellar: :any_skip_relocation, catalina:     "f973db7e060a32a5a0a5a7123b38d1d7853c72969465a0e219785eb0834f309c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b650c6bf85468cc7d856f15423e971e14b7f31e8264df297122d295bc924d70"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
