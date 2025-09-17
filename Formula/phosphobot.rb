class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.122"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.122/phosphobot-0.3.122-arm64.bin"
      sha256 "9cdafafc82af6819eeef9c1ad0a32de8bd24fec420ddb688dc11fba2f9b54ed8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.122/phosphobot-0.3.122-x86_64.bin"
      sha256 "ab355f84f0954f3dc957a223f3b22fa4e7f72e2a0ded37e9f43a1e84dcbe6d95"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.122-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
