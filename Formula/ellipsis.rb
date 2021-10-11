class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.18.tar.gz"
  sha256 "196d553ef00090a40885e1c7818b6a5601ccad9bfc8eaad94e1ffa2814a1ea96"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.18"
    sha256 cellar: :any_skip_relocation, catalina:     "7b6a28539fb0b04a321a37269393552b27cfc02165069a50dbc9ae969ee8107f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6c11d1f1b2df0ea6f358e8f143a8d0fbc392bd03802531a36efd0bece0401643"
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
