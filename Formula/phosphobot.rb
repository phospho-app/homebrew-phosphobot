class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.137"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.137/phosphobot-0.2.137-arm64.bin"
      sha256 "87b4c8807481530708fc7c08401d750b94978e7e225bbd76261da468ed835024"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.137/phosphobot-0.2.137-x86_64.bin"
      sha256 "290ba69e44b4e567b01f3d47ab022250b898200c20acc9865ddb9fa8a32c6330"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.137-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
