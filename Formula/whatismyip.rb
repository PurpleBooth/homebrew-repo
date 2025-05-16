class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/main.tar.gz"
  version "0.14.2"
  sha256 "5574955200951ccea1d0119548c135f8c6dbb06b22b1d47d2f657edcba024490"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.14.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "70a39fe62f9a5a9f93a7dc7bda22af11ee893929c18b3728a4fd213396dbf693"
    sha256 cellar: :any_skip_relocation, ventura:       "218e120c6702fbe837909575e4b8acf2be68367ef055a57a44c4ab7fe2ca0c30"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9e7163cc6a8a1cd0ae85e46ebfe1445e857b94317d97885f85bebf488743ca68"
  end
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
