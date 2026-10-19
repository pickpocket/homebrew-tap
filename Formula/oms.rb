class Oms < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://github.com/pickpocket/oh-my-soup"
  version "18.11.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-arm64",
          using: :nounzip
      sha256 "16ce7e49dfc791eaa9a6d5c239fc8c935595aa3ea9500f601b0892478daf73d2"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-x64",
          using: :nounzip
      sha256 "51196ebe375e70bf84fee9490e9f76ad3b48b18a54c3299f9e2313170f554c49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-arm64",
          using: :nounzip
      sha256 "57cd6e7e1e6150ba64b99d914b6ba414149e4df2a1107dce8aae02865cc2af25"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-x64",
          using: :nounzip
      sha256 "d26371cb16ee5a81121d113a3aa783bd8a63e9e6c2e1184315ced6edac97b668"
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
