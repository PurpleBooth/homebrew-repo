class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f4c3acb2370a4bb162b472c1c8179e91955086313b5a4cb6e2b6f2e862d5398c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "ec7e3c0f233c51f06455d067d6add5057b0ca591290a47589267fdbd2c3b90fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f654f7bf47ae743741d024fd5883cb98b3855e4b8e4f793231a72a41d925e761"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
