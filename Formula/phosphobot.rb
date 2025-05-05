class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.197"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.197/phosphobot-0.2.197-arm64.bin"
      sha256 "666778de36ff2c3a14eddf879bc570c08bba0766cbc099382ef8712a0ebbb996"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.197/phosphobot-0.2.197-x86_64.bin"
      sha256 "43c1616a6a962f4a3be416b1491490309dcfee17e3b523f3f23aa8f7f63f70e7"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.197-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
