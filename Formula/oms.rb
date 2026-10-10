class Oms < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://github.com/pickpocket/oh-my-soup"
  version "18.8.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-arm64",
          using: :nounzip
      sha256 "5777fa774d7fefb4d8585b19b3ba1924c30237108d8a5239939892c3a597fada"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-darwin-x64",
          using: :nounzip
      sha256 "04db0d5c304ae1927e7cc769454fe3c56b59d24f69be380a94c39ba6a1910e50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-arm64",
          using: :nounzip
      sha256 "a3a900cc0f68a5cbfc31d325fa91999dc5e43d2a343179bccaa9111f99161aea"
    end
    on_intel do
      url "https://github.com/pickpocket/oh-my-soup/releases/download/v#{version}/oms-linux-x64",
          using: :nounzip
      sha256 "f33fa344bf76891feb92de3fef739acb9150f12992123e253bba642b251dd437"
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
