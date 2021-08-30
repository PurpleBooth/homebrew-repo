class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v1.2.0.tar.gz"
  sha256 "916cb39ee30f3458325461a29fac1880961db0b607a10e07d29d710ccba21ae2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-1.2.0"
    sha256 cellar: :any,                 catalina:     "be995c8cda11dc13c63157c2243efc915e00b3184010c924f7962b3106786263"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3947daa7f19d4ef342d57b918e2ffb2b19b45c46dcd0fc8664d35aae9f90dfd0"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"
  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://github.com/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end
