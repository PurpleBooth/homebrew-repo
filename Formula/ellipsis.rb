class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.3.tar.gz"
  sha256 "2a1cd90f88086da20a2c9c8523693eec2e7a7e8732fe3230c0d32b86f1129e49"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.3"
    sha256 cellar: :any_skip_relocation, catalina:     "208aaf0c00c97d65cef2e827c13399d3011788e436290bbeaf61f82f941e7c5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "98f3567b8a15cf9f7a12a356f09d1fb8fe4a3888a6449e1c3e0eba35107a9cdc"
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
