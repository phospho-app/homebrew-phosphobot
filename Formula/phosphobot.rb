class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.91"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.91/phosphobot-0.3.91-arm64.bin"
      sha256 "48822d966e8ccae2ef524d3b4ad47efb73056f97187372b398ffaa26eaa18121"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.91/phosphobot-0.3.91-x86_64.bin"
      sha256 "a13679c8a48f15b349115186dd491729ee0be2875a55da02911ffd106a913fba"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.91-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
