class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.151"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.151/phosphobot-0.2.151-arm64.bin"
      sha256 "a08d60ae60c12e6c402e25f57d8a2fa9a34245fd150402b17e24ac127c2fcb45"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.151/phosphobot-0.2.151-x86_64.bin"
      sha256 "e58cb677a0ddb9847643280ab6ab8d695594159a55bb07bd0c31c4be3c141762"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.151-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
