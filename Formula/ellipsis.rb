class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4de246a920c7db27c2387e4638c131aae6e6f2169bc301cd1729fac5406e1301"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "ad3f0e82854e4a3e4669a5aa464cfc7b8038586db1ef65eebe313bfd8fbba1f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8198f33811275495560911679fbf0174e27c2111da29fe42347f3db311a722e3"
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
