class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.93"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.93/phosphobot-0.3.93-arm64.bin"
      sha256 "6ec21714bd3dcb9483ad79305e142e0a39d1f633a85f65f33ca47a6696fd6df1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.93/phosphobot-0.3.93-x86_64.bin"
      sha256 "c044be6a6870c94bbdbc887c21cc9db6b4d1419a23461ed84d1fa793024b3a62"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.93-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
