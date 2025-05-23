class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.13"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.13/phosphobot-0.3.13-arm64.bin"
      sha256 "bb463b49be2c0641a077dc005bcb5860b0a098372d88957faedbd59ed57a1f21"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.13/phosphobot-0.3.13-x86_64.bin"
      sha256 "b66a0527705764fe7444b67759b927de54d8c2d808c90478bff3564ec797fab8"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.13-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
