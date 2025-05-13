class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.8.0"
  sha256 "15423fdc66f5d01ed91c51b2d5d1d0ebe744ff95f14270c6344da25b8b7fbb5b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.8.0"
    sha256 cellar: :any,                 arm64_sequoia: "3e8a7007a7df1962e7cab7c6f1c9b71a620d3c3c9c70d112f935c8bf717a299f"
    sha256 cellar: :any,                 ventura:       "e2590416af6d5cab8115e8aede7a80b47ab3246a8474b67347c0c3b578db9f78"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "98c87b3d923a158cc63ccb9304a375ecf162baa27df8724816b620b9c6cd662c"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://codeberg.org/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end
