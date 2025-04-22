class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.163"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.163/phosphobot-0.2.163-arm64.bin"
      sha256 "8f151b1ad7026379eb7f690d67c5cf66072e85318d38de79e28b5abf6ad7d714"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.163/phosphobot-0.2.163-x86_64.bin"
      sha256 "e8755d79174cb4a4b5ab1453654f1665589aebac7746c0c9abc2350ccd7e5bb4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.163-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
