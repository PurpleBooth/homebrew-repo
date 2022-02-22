class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.74.tar.gz"
  sha256 "f7af64aa5b5c3da4dd9cab258e435273876171b06e6ab5f767230748825cf8dd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.74"
    sha256 cellar: :any_skip_relocation, big_sur:      "ec19b4edece58961fb124b9e84de34dea4ee23d12999b7e2ebb0de0c03c2a4f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6d3f6b8336852e2a930f07e8486d5aa7c63e4f4f0277686d21cc4b0fc0427960"
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
