class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.90/phosphobot-arm64.bin"
      sha256 "fc50317cb5a63e6e996b53a00b65286585787927d879594f8d17793ecd1a10aa"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.90/phosphobot-x86_64.bin"
      sha256 "3cc9e538ca1e5ee3f9fa05194f436515c5274cd22b7e8f718f109c573cb4eae9"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
