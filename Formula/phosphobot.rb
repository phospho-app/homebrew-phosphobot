class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.110"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.110/phosphobot-0.3.110-arm64.bin"
      sha256 "de95e552be20bafa2bfcb3b6a2710cf603a6609b4103150f0d485cd19eff5010"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.110/phosphobot-0.3.110-x86_64.bin"
      sha256 "3f0cd9a9984791d1d578b368607334652bb24726ca1d0a62730b17649bc1bfdf"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.110-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
