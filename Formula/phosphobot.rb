class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.169"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.169/phosphobot-0.2.169-arm64.bin"
      sha256 "bcaca0d69a36f3816fe670ef49700f732d2efdcfb9472b80db5bcf076610175d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.169/phosphobot-0.2.169-x86_64.bin"
      sha256 "037e2e8bcdab323967a62a4eceaa9532936a5153bd17bf121213abfda5123c3e"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.169-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
