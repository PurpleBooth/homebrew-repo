class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.42.tar.gz"
  sha256 "3029f1ed08ed6ca4a5cf2a81125d05ef35cb9c16d54e51350eccd0cbebe5f6b9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.42"
    sha256 cellar: :any_skip_relocation, big_sur:      "0106beadd4abb7bbb1d16f6d19330826b6b78cb15475b12ea0713924bdb8ef2a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0de7e527b53273602cfd015bef0c1430ebd69c37ad632348dd09f6dd3fa54008"
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
