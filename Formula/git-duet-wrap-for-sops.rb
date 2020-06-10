class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.30.0.tar.gz"
  sha256 "40aca26990014d91bf4f4a74ec6519dbe762b00a35110a7668d97c5a30aafe35"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "dd017b05fc2ea29df555c4d5ce0f06439bd6ee83c08c7f02efcdf2798b01f733" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
