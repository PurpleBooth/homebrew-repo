class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.22.tar.gz"
  sha256 "b834535a8d28678712a47b9897a363848dcd597e473edcff74c68fa7173d8190"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.22"
    sha256 cellar: :any_skip_relocation, catalina:     "86a78b982f51909c973fa117fc4fee8bb6e18c04d75e78a0abaacd518c380806"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c2f610858b7cb26f198ac191a8b2135bcd13a80a882d8f5b94dcaaac1584c87"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
