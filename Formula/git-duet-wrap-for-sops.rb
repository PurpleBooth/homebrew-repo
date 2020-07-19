class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.0.tar.gz"
  sha256 "a318b49f90694022010527faaf872cc45afd8715b3ed404782d2df71faa14196"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "a89ca4962601918ad659aca29ab8ab61c115764251589bee099a62b96558c09a" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
