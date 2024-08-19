class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.11.6.tar.gz"
  sha256 "fe3a2bacdcd27ce53661ec99d16ef8237d1e929f240e78f4d7f13dc4d943a5c6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.11.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f307c0a5bf802a7b58170b7b59829d58069b4ad47217db914253903fa18f01f2"
    sha256 cellar: :any_skip_relocation, ventura:      "df54a46f8f9c2f4c020e73396ed66230e2ec1fbf9790c81ee426511f0e1c866e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "009b17f932bd81d039930084291161f6e279643f4489b4cecd38c59579aeb768"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
