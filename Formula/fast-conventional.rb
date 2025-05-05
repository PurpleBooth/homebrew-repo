class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://codeberg.org/PurpleBooth/fast-conventional"
  url "https://codeberg.org/PurpleBooth/fast-conventional/archive/main.tar.gz"
  version "2.3.107"
  sha256 "4f7867425343fcb554e786cad7ee4234c35bda74cb6dd643e41ae63c8b07d56d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.3.107"
    sha256 cellar: :any,                 ventura:      "cac59d52fe23b9550b0c25e12612a965b2e5cdc2a5751e7644ed10ebac69876c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "98f47c7a151c0dd77ef4420b1bf97862695a047a667cf49fe2a0170471ca0fc1"
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
