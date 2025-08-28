class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.108"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.108/phosphobot-0.3.108-arm64.bin"
      sha256 "0049c207dfa142ebd8e99530975f1cde27acae4ca5627b252abe494e675f6560"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.108/phosphobot-0.3.108-x86_64.bin"
      sha256 "0a12dd4102e7d31e6a300d9566017a9a9a09db6de68fc01f95dad2d00f99fb8d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.108-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
