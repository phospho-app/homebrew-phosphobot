class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.48"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.48/phosphobot-0.3.48-arm64.bin"
      sha256 "dce8139ec4866493a1268a37cff48f6f0af35c4922fbf3d1d86c33683d9f37e1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.48/phosphobot-0.3.48-x86_64.bin"
      sha256 "ced11e3c00d4448d46db6add8bb28ea9b6c7da2be1681fe1cba581d014a3d787"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.48-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
