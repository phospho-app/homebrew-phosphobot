class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.136"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.136/phosphobot-0.2.136-arm64.bin"
      sha256 "d16898c7fd3161bd40f3d19ed1d0f5450899f327daced57b0083f216093f16af"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.136/phosphobot-0.2.136-x86_64.bin"
      sha256 "8947cd6bee08d4c1009407e9b9a93b5928876080f32804dfb2be0022cf3228e3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.136-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
