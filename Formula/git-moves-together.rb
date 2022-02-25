class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.25.tar.gz"
  sha256 "6ffe26980228e792b1caac97d74b9d4ea2b3745fb3a430ae02f631bd0167dd80"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.25"
    sha256 cellar: :any,                 big_sur:      "b0a99b9861dd8de2f1cc86752dba60c38ad02b841dc617b32eae14bc059b0924"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9ac6a6b6636452961f933a241dd084746d0f52861876e7b6f3a0b0c4c3bddb4"
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
