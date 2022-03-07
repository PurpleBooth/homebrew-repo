class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.37.tar.gz"
  sha256 "61eb448e32d55a4fffed677fcd2db87ed9ec2aa64b584bb6f3f92e9e8e76774e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "6cf66e0c720a25efe6b4611fdc0da497706592cda889ddb683355b77fdfdf070"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ca21aad4dee5557f96437757979157bc99867076dc85ec21e8783c6dd7b5692b"
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
