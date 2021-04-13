class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.20.tar.gz"
  sha256 "e27960ed8c46c129477eb01586db2018357ca08af874e87606a7c7685b0bd89e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.20"
    sha256 cellar: :any_skip_relocation, catalina:     "3e36c412ddd27ebcae6adcdafb05081a4c97b9aa72eac6f4922fbf3d48c51e45"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9521842d3444f1448856d6c12ca2b0932069a42433d8f0f8a94511441a55761"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
