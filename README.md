# Scrapbot Homebrew Tap

Homebrew tap for [Scrapbot Engine](https://github.com/scrapbotengine/scrapbot).

## Install

The Scrapbot cask will be added after the first GitHub release publishes macOS archives.

Once available, install it with:

```sh
brew install --cask scrapbotengine/tap/scrapbot
```

## Maintenance

Casks live in `Casks/`. Validate changes with:

```sh
brew audit --cask --tap=scrapbotengine/tap
```

For a local cask file:

```sh
brew audit --cask ./Casks/scrapbot.rb
```
