class Oms < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://github.com/pickpocket/oh-my-soup"
  version "18.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-arm64",
          using: :nounzip
      sha256 "f6c472357dd6829c30adb68d4b4888e7bb37407de5cb2347b7b0fdeced2dbc78"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-x64",
          using: :nounzip
      sha256 "3822d4118a50016eee3eabc22100477c33a1363572166b103928115ddc28bb88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-arm64",
          using: :nounzip
      sha256 "8c548021742a11616e74626319a0681f00c751aba2a4d15cb227741270a87a07"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-x64",
          using: :nounzip
      sha256 "449cafde9f81570b0a8d48dd19695f180d2dc553569473baac0b956429d702a3"
    end
  end

  def install
    bin.install Dir["oms-*"].first => "oms"
    (bin/"oms").chmod 0555
    with_env(HOME: buildpath) do
      generate_completions_from_executable(bin/"oms", "completions", shells: [:bash, :zsh, :fish])
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oms --version")
  end
end
