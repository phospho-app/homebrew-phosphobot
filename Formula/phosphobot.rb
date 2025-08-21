class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.94"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.94/phosphobot-0.3.94-arm64.bin"
      sha256 "c194c5ba5bd3a63b5931c0472904b2895ec2b0129afa90508488e4d18623cbca"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.94/phosphobot-0.3.94-x86_64.bin"
      sha256 "a9a1c263cb39e46d24b992bca23d425afb6fa9861871b5d64ee24af96fac5da8"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.94-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
