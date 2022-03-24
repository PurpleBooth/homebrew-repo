class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.77.tar.gz"
  sha256 "8f73b0230267b69f33449f90b77f94bec6a4391e1dd32251c160c4d385d74386"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.77"
    sha256 cellar: :any_skip_relocation, big_sur:      "96c98064a88991bc26b3fb84fea409af1de9dfc497696c2c10b72fa73b4d6feb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a5b479bf0f5145654e6eb846575895c272cccfa40689b1e24278ecab56f4760c"
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
