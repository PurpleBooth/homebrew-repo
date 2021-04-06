class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.61.tar.gz"
  sha256 "d40a02a3fb133319cd6c322c2010c5bfd0971d725a35ace7bbe74c57bb470a12"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.61"
    sha256 cellar: :any_skip_relocation, catalina:     "0a6073152f351d5a57a478c15ffa1fe2178c76e18b7f640bd6e279e713a6687d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "298e8d1582bc9a0d72b34e77272868340e76bdebb1aa4dbca976eca4e31d054e"
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
