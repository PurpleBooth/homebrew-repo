class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.8.tar.gz"
  sha256 "7de6c2a57c59deb7585c0d9bf7dcc757d011d1b7087c71b5f023b0b574a028b1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.8"
    sha256 cellar: :any,                 catalina:     "41113a9ff7f22592029be4d25f3f16228f35e9dd659f21e95c65e9ede6969b07"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b24356401f48e65ed4ecffde26226854b2fd6bc326d663c71f476ae6a258b692"
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
