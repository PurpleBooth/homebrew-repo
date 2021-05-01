class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "1311b4b6893174b83e267dadd618dd97e7b3381715e220c419db9d4c3fbb19d8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.3.1"
    sha256 cellar: :any_skip_relocation, catalina:     "bbb8494bb2a55f579bc520fd741b22a798c7957f672445013bfe1fceeac7beb0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1eefb7d19ee5a81673d561fd17aa20fd8236b0559ef985a99ffc8ee0104b864"
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
