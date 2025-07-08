class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.54"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.54/phosphobot-0.3.54-arm64.bin"
      sha256 "65ae0c7d5712136047e0b1e2b1013da339ac1333f42e8892fd05970c0b86d09f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.54/phosphobot-0.3.54-x86_64.bin"
      sha256 "910577002fd2b4fb07d1c5c80c781fcc7ace35878bd43733f61f5915e608d2ed"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.54-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
