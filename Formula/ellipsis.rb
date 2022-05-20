class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.46.tar.gz"
  sha256 "a031dd973de2214feefc63744efab0242a7f6edc29bbf4ef192a38c725646b9b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.46"
    sha256 cellar: :any_skip_relocation, big_sur:      "0c6c6f95e7a13485ba606aba08604ca8a20329b5ff54e4409603f7d264591faa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2a066d9b81d6091834bc126c264012aca0cce366be07704361ce45458e70620"
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
