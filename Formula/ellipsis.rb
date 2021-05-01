class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "02fcd58878ccc08e7f97aad90540bf4ce2c7a847928d9fa58415693b6120d7e0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "4dc3513549b92f05a5bb7b37939d1a5735e7444538712bd946f2e214a742f889"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d547ce1a816fc13bc1280ec7c849aa55e2d0f5c66afb542a9ac00e4fb6a6b693"
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
