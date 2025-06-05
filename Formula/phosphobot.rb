class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.36"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.36/phosphobot-0.3.36-arm64.bin"
      sha256 "d0456a0414acef099678dfc9338e985327f7406b138ea4166811834a432067b9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.36/phosphobot-0.3.36-x86_64.bin"
      sha256 "d872876182210c81382ba534f5581377429608f9006c0bbdd8c88730cd180988"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.36-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
