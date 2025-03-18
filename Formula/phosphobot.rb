class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.92/phosphobot-arm64.bin"
      sha256 "85ed27ac8d6a68193f68209c0eaa5069cd781d1b045e6196095701e4645a9d45"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.92/phosphobot-x86_64.bin"
      sha256 "51fa337e843c4a2e7ccdcb0c745cc9e7a11ca7959af0ce55264b71c27b9e9047"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
