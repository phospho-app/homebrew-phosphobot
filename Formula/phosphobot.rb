class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.111"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.111/phosphobot-0.2.111-arm64.bin"
      sha256 "f87b38c9c9a16bd135314de1e931417c54ac5562b9e2cf05527bec41e6be249c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.111/phosphobot-0.2.111-x86_64.bin"
      sha256 "71c7095139da1763f84fa659bab9449fa1a0477d0b2347dc0bb77af532678935"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.111-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
