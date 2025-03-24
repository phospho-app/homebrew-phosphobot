class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-/home/runner/work/_temp/e87911a8-0993-40ce-afe6-3d2e42be385c.sh.2.99-arm64.bin"
      sha256 "250d8beee115fe7d50415c02863e5f0eb2b3947ca1675e7fdfd9a744305c658e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-/home/runner/work/_temp/e87911a8-0993-40ce-afe6-3d2e42be385c.sh.2.99-x86_64.bin"
      sha256 "712ffb050dbd371dadc85bad5c223e234b787e160895ccd35840571ae4eae331"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-/home/runner/work/_temp/e87911a8-0993-40ce-afe6-3d2e42be385c.sh.2.99-arm64.bin" : "phosphobot-/home/runner/work/_temp/e87911a8-0993-40ce-afe6-3d2e42be385c.sh.2.99-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
