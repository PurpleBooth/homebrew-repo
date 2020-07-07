class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.42.0.tar.gz"
  sha256 "48edfd58e21fe180eababbbaa567cfcac9fb5bc8fa1425a8a6ff72692824a925"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "167c4c2759de84067372f2ae7e779981c6c671f2b1ac5ad44fc1b8a6c05e1fd3" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
