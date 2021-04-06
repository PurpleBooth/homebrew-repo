class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.46.19.tar.gz"
  sha256 "47c7cdb8a96d9fb4aad8f72f80879ffc8e91a009a94f422fea4cb3889aefc61b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-duet-wrap-for-sops-0.46.19"
    sha256 cellar: :any_skip_relocation, catalina:     "8f3a9bbf99708474dcba153b3023aec16ab1018f7de9da1b1a14920bdb358ac5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9ea4a8da9f4995c1bc4e1978ad623ab662d3cbb9becd715ce6e918afc3f3386"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
