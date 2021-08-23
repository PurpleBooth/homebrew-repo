class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.10.tar.gz"
  sha256 "557e80768a31b3fe51b986dea819980cf11afdc81579e48cb8ff357ba7bfa980"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.10"
    sha256 cellar: :any_skip_relocation, catalina:     "8491c7b1fdff7797506293cc68e1215b0bef5ce53debac860db68d724ccdce13"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0d3bc36e9d4156ba1f2e5fabf39dc97b578d570f55b5d7c74ffd40fbd99a7c75"
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
