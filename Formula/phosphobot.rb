class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.130"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.130/phosphobot-0.3.130-arm64.bin"
      sha256 "68a444040d42fc91cdc46812c29217c3b4d19b1dd0e82c71fa988882428053c7"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.130/phosphobot-0.3.130-x86_64.bin"
      sha256 "b454d10951ff9cafabc75d1fee6fdc1acf1fb6ca4583f7380547d2fe1cc9a272"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.130-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
