class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.32"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.32/phosphobot-0.3.32-arm64.bin"
      sha256 "465534db972aef102f16c17b2787fddb4683f69604521c5eff4f8e76f688bba5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.32/phosphobot-0.3.32-x86_64.bin"
      sha256 "e5a2581215ba0dbf5d221e66038673b0591a0dee3d90c2bb6afa47195bc8aaee"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.32-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
