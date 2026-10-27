class Oms < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://github.com/pickpocket/oh-my-soup"
  version "18.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-arm64",
          using: :nounzip
      sha256 "5a70553b431d0ff6d6346be5ada529100e66c2479863f72245fa6491f056754e"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-x64",
          using: :nounzip
      sha256 "9dd556210c48b1e3833f0bd49861e3b1af7e4604921b8d5c6df9f1b9b741c47c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-arm64",
          using: :nounzip
      sha256 "0a75d98ddbe938e74cec5e62dd61533cd2f4e0b3e01e4cd9221d54c4cb4831f1"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-x64",
          using: :nounzip
      sha256 "f940b3dac2d74b639e0dc948bfc4a53087d3af2c4bbb83cb68a177671b0adf5d"
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
