class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.49.38.tar.gz"
  sha256 "bcb57244f9680a894c513a8a1c303a2417d5b9a58a70978c37076652e7e4c7c0"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.38"
    sha256 cellar: :any_skip_relocation, big_sur:      "6dc143a0eef8997e9fd92a47c1e94b3321d91f6b33dd6e218064ab9e50a8f988"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa0bf036f4c054abacb995937cc63dd51756e1e92089b19c8516a9c6b6f35cc1"
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
