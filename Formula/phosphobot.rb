class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.115"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.115/phosphobot-0.3.115-arm64.bin"
      sha256 "99356f359b0f6625aee8a2a9d3f08aa9b3d7aeb97b899a0034518530d811bc32"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.115/phosphobot-0.3.115-x86_64.bin"
      sha256 "931e8426ccbda4577b0dedcc34897675ba7e37466ac8aae0115f5818c5fc9435"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.115-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
