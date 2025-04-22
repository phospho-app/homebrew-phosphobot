class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.162"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.162/phosphobot-0.2.162-arm64.bin"
      sha256 "0426c54c0d304fcddefe03f50f58fad5b2810b7696ffc5268c2b2077fdf5b2f3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.162/phosphobot-0.2.162-x86_64.bin"
      sha256 "6db13f2f82d5a6643583a3292207a535ad2a4c64de1c99ee7582d6d93ab46b84"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.162-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
