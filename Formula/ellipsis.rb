class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.36.tar.gz"
  sha256 "3c4685e31658c350658f7530428fe7037d9e2debf76dccdaaf0621326bb4325f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "1b6062ec493f28af8aee2f3e5e6b7315de79fd0cb6a5d7c79ef9b09ea09d7ae1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3695bb658c279fd5b4b94b0e623584e9fb9e2e1d444d3e86e294e73b6276ef72"
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
