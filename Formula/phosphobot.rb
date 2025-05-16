class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.3/phosphobot-0.3.3-arm64.bin"
      sha256 "462c2a45fb49bbb1cb3faaf8083005425ffe635803f5cabf91b4bfa53aa35215"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.3/phosphobot-0.3.3-x86_64.bin"
      sha256 "1af7a38ff19affc0e81d35164f69f4b6fe4034ee6f2e34b9dce0ea632a608883"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.3-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
