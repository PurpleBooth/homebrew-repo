class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.59.tar.gz"
  sha256 "348aa16f2985e12fe4de4ed48a7e443319a5d9b417ad8b7a68a8178ddce472c0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.59"
    sha256 cellar: :any_skip_relocation, catalina:     "ed4e1ba4d65472190416215d2e8523491e197192c4c90ea3b28ecb4bb8df91d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3112e92d60c2942a1bc42fbef0139c701f156bfe8cbcd808aa81b9c263d8f949"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
