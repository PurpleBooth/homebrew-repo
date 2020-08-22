class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.6.tar.gz"
  sha256 "e890187c09d88a9b79ab42cdab111e6c6820b96ee10a1417ffbdb4e5266ddb50"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "eaafab759705ac848a01b1cdf4f82a394da5bc812e98ac8faa55a5d1ff9561d8" => :x86_64_linux
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
