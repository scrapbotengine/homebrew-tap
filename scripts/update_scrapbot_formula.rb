# frozen_string_literal: true

formula_path, version, arm64_sha, x86_64_sha = ARGV

abort "usage: update_scrapbot_formula.rb FORMULA VERSION ARM64_SHA X86_64_SHA" unless x86_64_sha
abort "invalid version: #{version}" unless version.match?(/\A\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)

{
  "arm64" => arm64_sha,
  "x86_64" => x86_64_sha,
}.each do |arch, checksum|
  abort "invalid #{arch} checksum" unless checksum.match?(/\A[0-9a-f]{64}\z/)
end

formula = File.read(formula_path)
formula.sub!(/^  version "[^"]+"$/, %(  version "#{version}")) || abort("version field not found")

{
  "arm64" => arm64_sha,
  "x86_64" => x86_64_sha,
}.each do |arch, checksum|
  pattern = %r{url "https://github\.com/scrapbotengine/scrapbot/releases/download/v[^"]+/scrapbot-[^"]+-macos-#{arch}\.tar\.gz"\n      sha256 "[0-9a-f]{64}"}
  replacement = %(url "https://github.com/scrapbotengine/scrapbot/releases/download/v#{version}/scrapbot-#{version}-macos-#{arch}.tar.gz"\n      sha256 "#{checksum}")
  formula.sub!(pattern, replacement) || abort("#{arch} asset block not found")
end

File.write(formula_path, formula)
