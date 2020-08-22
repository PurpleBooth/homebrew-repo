class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.12.tar.gz"
  sha256 "c7d06361dce24e7697d872d639479fdea43b6708a4d77b75ba4adcdd685be668"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "183022d8de27f235bb54425e73d74c6d2248bf0a46ccc98e7992940c23ed4777" => :x86_64_linux
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
