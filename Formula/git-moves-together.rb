class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.3.tar.gz"
  sha256 "255d3fd04a94c35e33127e5436ae7337c1bbf6ca476c54c5003f0ab04dd67adf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.3"
    sha256 cellar: :any,                 catalina:     "8a9434bacf704ed0d7514bedfe173401e49fab8a1ffb031aca0a808a6ec83909"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f95aee7ea8f1632be478ecc8d106adc51566e1999f7c5e032cfb50311d69ee2c"
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
