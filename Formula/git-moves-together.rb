class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.8.2"
  sha256 "cc9a62a866e7c0f42208d09c863158a791bf1d28668fd82136ffdb4d810dd1b3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.8.2"
    sha256 cellar: :any,                 arm64_sequoia: "39ba9ec7cf20964cf2f9b6dd1c8d003f89be9fc459f8e66cfa97e94f9b366726"
    sha256 cellar: :any,                 ventura:       "1e2204fc258e6dbf546fc9a1a8a9fa9c84651923b138e01e8f3b225a39e6b045"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "99057de7b455cce7e267da98fc4c387f9d1a494c29117163f173a5aa48f34d1e"
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
