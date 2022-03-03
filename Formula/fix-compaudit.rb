class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.76.tar.gz"
  sha256 "465fecdd599accf3771cb7bffe0b988162c508ecdbbdf6b40f85cd2d57f2348b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.76"
    sha256 cellar: :any_skip_relocation, big_sur:      "abe0ac5bfad2912d9f709c2d0737ff83d79b495d4d4a088ccec674a60303ea7c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "95ecaf39514f14fbab259b102d7c95a1e981e2a2e5e9dc4ee9d70a3c766187f6"
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
