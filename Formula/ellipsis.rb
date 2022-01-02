class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.25.tar.gz"
  sha256 "3e5d63db60e496f52c45989e80c2084ad8457c2ba1f14c72f9703d84f7bf4956"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.25"
    sha256 cellar: :any_skip_relocation, big_sur:      "25663c0a5b2a1205d3cf1d0183ac80d35c2c985645cb15b038525a52a2754be4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "99070ec0f09ce05abbe0801b35af052b372fcdfda3c3d7d7d5970e2e318d0876"
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
