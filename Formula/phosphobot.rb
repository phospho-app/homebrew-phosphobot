class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.200"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.200/phosphobot-0.2.200-arm64.bin"
      sha256 "04a67975ffe001185650ab5650cd80841f268d1e05987e5ed526b9b47912034a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.200/phosphobot-0.2.200-x86_64.bin"
      sha256 "cbf2cb59ec72276c45739cbc1a88d428bac3b16261e016399ee58791fd681ea4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.200-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
