class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.6.tar.gz"
  sha256 "e900ac74f6a617e87bdcfe63928b866908a399a45dd5f66dc173812f13cfbd63"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.6"
    sha256 cellar: :any_skip_relocation, big_sur:      "bcf9b0c3bba53c31d45b019a21b06393cfc5244b31d2267250dd01c80f090ab1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4014c5f1a287fde399a5459bdbba36aca653ba266b1d7dc77949f9117183184e"
  end

  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
