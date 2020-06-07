class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/refs/tags/v2.112.2.tar.gz"
  sha256 "9962599d9f8f05c1a090ebe3cb24fe052adc1a264eae5406e872e0b1685b2b27"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "9433884846b8c94bfb62a404c781931551c505672ad28ff18a582304a34312dc" => :catalina
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-authors/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-git-hooks/"
  end

  test do
    system "#{bin}/pb-commit-msg", "-h"
    system "#{bin}/pb-commit-msg", "-V"
    system "#{bin}/pb-pre-commit", "-h"
    system "#{bin}/pb-pre-commit", "-V"
    system "#{bin}/pb-prepare-commit-msg", "-h"
    system "#{bin}/pb-prepare-commit-msg", "-V"
    system "#{bin}/git-authors", "-h"
    system "#{bin}/git-authors", "-V"
    system "#{bin}/pb-git-hooks", "-h"
    system "#{bin}/pb-git-hooks", "-V"
  end
end
