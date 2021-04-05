class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.17.tar.gz"
  sha256 "419095ffbff064eb3b3ebf15d8061b0e6f060e4dfdfd1361fddc1509960e7a94"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.17"
    sha256 cellar: :any_skip_relocation, catalina:     "e25bad549f9b12ca6bc94fad596dc07c416ec4cffddf1a962f558bc9ce453e3c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6e9a602830ed6e3e7420b1c4680f016523acc45a6404588c34df6e4a7286f70a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
