# Scrapbot Homebrew Tap

Homebrew tap for [Scrapbot Engine](https://github.com/scrapbotengine/scrapbot).

## Install

```sh
brew install scrapbotengine/tap/scrapbot
```

The formula currently ships macOS release archives for Apple Silicon and Intel Macs.

## Maintenance

Formulae live in `Formula/`. Validate changes with:

```sh
brew audit --formula --tap=scrapbotengine/tap
```

For a local formula file:

```sh
brew audit --formula ./Formula/scrapbot.rb
```

`Publish Scrapbot` checks the latest GitHub release every hour and updates the formula once both macOS archives are available. It can also be run manually for a specific tag. Publishing uses only this repository's `GITHUB_TOKEN`; no cross-repository personal access token is required.
