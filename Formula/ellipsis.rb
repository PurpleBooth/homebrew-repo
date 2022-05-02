class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.43.tar.gz"
  sha256 "94c8cb5c9c033cc3680228144c9997b7965740b6819a5841bbbb2a9ce66fc3a8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.43"
    sha256 cellar: :any_skip_relocation, big_sur:      "6fd5b46d76fff875ef865da6702a81010041416b75c21196ccf432d343c02259"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "59de05b15898581ab1663eae5141b9fe7750581857bf20da279b3456717fb18b"
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
