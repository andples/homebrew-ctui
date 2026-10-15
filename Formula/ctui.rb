class Ctui < Formula
  desc "Minimal terminal calendar and task list (TUI and CLI)"
  homepage "https://github.com/andples/ctui"
  version "0.1.1"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/ctui; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.1.1/ctui-aarch64-apple-darwin.tar.gz"
      sha256 "695a17d8fa068c7db8a8daad6d52fa1567101b6501e196418519511accb824cf"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.1.1/ctui-x86_64-apple-darwin.tar.gz"
      sha256 "c105400e3f7fd940188367b5da37b8abfe586667ff9dad378607f64450c55b1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.1.1/ctui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1dded505920f89a8c068efa11412e7e37dc1c91569e3ae856bba3ec7811ed0aa"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.1.1/ctui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70734170f29d1aa2b681620fcb5e34576c88ef6d29d7ec2b0c9aa71632904f1c"
    end
  end

  head do
    url "https://github.com/andples/ctui.git", branch: "master"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "ctui"
    end
    # The Monkeytype themes (GPL-3.0, separate files); ctui finds them in
    # share/ctui/themes next to its own prefix.
    pkgshare.install "themes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctui --version")
  end
end
