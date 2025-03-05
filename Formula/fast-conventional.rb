class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://codeberg.org/PurpleBooth/fast-conventional"
  url "https://codeberg.org/PurpleBooth/fast-conventional/archive/main.tar.gz"
  version "2.3.92"
  sha256 "56c0148ee67c48aea35ade7edeae0fb36a74504caaf224e3abaed3a23ba2a554"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.3.92"
    sha256 cellar: :any,                 ventura:      "9498c51958f6a93c4a2d44a24279ea68e749a85b68fd5cbd9368788d8e3c2eb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "866e96571070f837d154aea301d2dafee8f6be0c3065c9ed8a95cd24c3c5d651"
  end

  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test
  depends_on "openssl@3"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Install completion
    generate_completions_from_executable(bin/"fast-conventional", "completion", shells: [:bash, :zsh, :fish])

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/fast-conventional")
    (man1/"fast-conventional.1").write output
  end

  def caveats
    <<~EOS
      Update your git config to finish installation:
        $ git config --global alias.fci '-c "core.editor=fast-conventional editor" commit'
      To use it run
        $ git fci
      You may add any of the usual commit arguments
    EOS
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}/README.md\""
  end
end
