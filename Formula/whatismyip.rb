class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.29.tar.gz"
  sha256 "526e67d059e45932e7bf30f04269a7a01b34a02651ced48c3262422525fefdc6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.29"
    sha256 cellar: :any_skip_relocation, big_sur:      "9bc473ee4b5b9197922ea2256788063d0825bdf1c6729abeeee8fe8cc1a79e9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1cd8fd3441dff53475adf23e9512b6c7ff5dda5ef28bce9096b5fe40cf99d457"
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
