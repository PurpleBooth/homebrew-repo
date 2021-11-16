class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.6.tar.gz"
  sha256 "0913cae29f2fed2b9abd70b4b4072b96b392e5d0f10f4457962544c11c27e02d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.6"
    sha256 cellar: :any,                 catalina:     "56cf488a0182df30204cfd804feb0acd71a0eef484aef71ae5666d90639dc7e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3963aa245092a945246911f9a2455ca8bcd208dcc5fa6ffdd8e8bd9fe72c8826"
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
