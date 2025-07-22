class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.69"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.69/phosphobot-0.3.69-arm64.bin"
      sha256 "8208e90e89ea311a50de1d3d0227027513903cfa4d69e48dc3b4634546dc8024"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.69/phosphobot-0.3.69-x86_64.bin"
      sha256 "744e5270219bcea5f5ff8c1e3c8584e7628e6cb12a248eb8f29b7a1938b743a2"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.69-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
