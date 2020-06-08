class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "e61cbb4aac4c7db6988c2616217e42fe995e3ca665da6aca24f304e0c097de36"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "3a870f32e701f60d6d75537d56f219bc9a7f13799140cbb77683e49ffb1407ef" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-gnupg-permissions", "-h"
    system "#{bin}/fix-gnupg-permissions", "-V"
  end
end
