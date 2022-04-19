class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.41.tar.gz"
  sha256 "d2ab545a85504dd17b278059a02a9a334df448b9759df2229cfc250a32833271"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.41"
    sha256 cellar: :any_skip_relocation, big_sur:      "1eb793bcf0fa15e881397bf684636bc4a31c98bc6f77b171eecac90047ec7d67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5141b67f7b0e82ddee396c2415b7bd14839af408b72ee775f848f0e99a59efe0"
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
