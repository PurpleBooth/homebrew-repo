class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.34.tar.gz"
  sha256 "f4f26533fea7323ddfeb06fc3aef3d5015af0379607f34576229aaf00d18d662"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.34"
    sha256 cellar: :any_skip_relocation, big_sur:      "6a9b237751126d196d87ec29bb18566f86acf4f6be67782a0f6c1b63af3cf2f7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "258b7bb75777d0bb2b0c70eaf55125b7ec3a17a405d381abb0e51e78c1ec1cd4"
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
