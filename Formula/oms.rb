class Oms < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://github.com/pickpocket/oh-my-soup"
  version "18.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-arm64",
          using: :nounzip
      sha256 "b9cbccfcfa61d48d51a0a598c9194f0987b3d194f83d329fae469f9e50e7ac3d"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-x64",
          using: :nounzip
      sha256 "856f0f8e299b19238e842a6daf74241ae17168aded86120b5f406a333f65db81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-arm64",
          using: :nounzip
      sha256 "6fc4b1b966705d02b42b8121206378169ce1ca419a08e60e12fd364460e7d526"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-x64",
          using: :nounzip
      sha256 "a4451b4fb2440983ef3aa58c5f62b83d6e837452a98c06fb6c0ad509bb43e835"
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
