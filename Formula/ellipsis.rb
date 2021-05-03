class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "14e27f12950a1badfa55db13388d6d004b4061e431115ef366185bd1e3b588bf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.5.1"
    sha256 cellar: :any_skip_relocation, catalina:     "13aae733e21f42f4561a769ece7c1fa92d9c0ab7c60c595888369ee934146e57"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "06e83e2193e62251bcf44a467d8ed0a231b7e2284cf967e2f9e2d5270bc85ce4"
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
