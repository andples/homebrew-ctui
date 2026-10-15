# homebrew-ctui

Homebrew tap for [ctui](https://github.com/andples/ctui), a minimal terminal
calendar and task list.

```sh
brew tap andples/ctui
brew trust andples/ctui   # Homebrew 6+ refuses untrusted taps without this
brew install ctui
```

The formula installs a prebuilt binary (macOS arm64/x86_64, Linux arm64/x86_64)
and all 39 themes. It's written by `scripts/release.sh` in the ctui repo.
