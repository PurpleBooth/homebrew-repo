class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.49.tar.gz"
  sha256 "7c229970b325a6a6deb08a11b23bc458a7fef413edabf2a44b5ceaeda359bb59"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.49"
    sha256 cellar: :any_skip_relocation, big_sur:      "df10bfa4a2a973378d4559e321fcadfbabb21d6ab4f58a71e29b79d82234f652"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6028940fca6176f8d02d70cd1f30085f95603716a53a1d6726649b3cb94a2e9"
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
