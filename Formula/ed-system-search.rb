class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.17.tar.gz"
  sha256 "678e02faf239422cc575d687e5423e76448379cd8106e8db764929c113cff185"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.17"
    sha256 cellar: :any_skip_relocation, catalina:     "1abe20196e6c80d1df564ce4f910a23dc3ed8b3ac9d6c3069eeecab32d6ac7b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f8fdeeb069060216a6399c680f06b9d1cb1ff6170209e8db37ffceb6e583d43c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
