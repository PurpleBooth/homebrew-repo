class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.17.tar.gz"
  sha256 "30853bb2c5438e816e0021bd7db439b3879de30eeb1508b39fb2d600ca034033"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.17"
    sha256 cellar: :any_skip_relocation, catalina:     "1bd2a07b62bd042c9cfb2589041f5b052b6eff2d928a01fb49180602689acb3c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4219184dcfec0245f48b992c2dbeaa49ce6561088f9a82dae86404282d320a98"
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
