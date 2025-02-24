class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://codeberg.org/PurpleBooth/fast-conventional"
  url "https://codeberg.org/PurpleBooth/fast-conventional/archive/main.tar.gz"
  version "2.3.87"
  sha256 "e377c858d3a5c9bd7e9dd16e328a4175e620198ee56f51a7f02e26170abb44ba"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.3.87"
    sha256 cellar: :any,                 ventura:      "121786da9f7600ef8242265414b02ba4919a890e377ea35f716c62a95994c2db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dcb6ac5afd3b2a63f7d505c043638f26053f39aea7798fe45a4a1c24c13a6cd8"
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
