class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.43"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.43/phosphobot-0.3.43-arm64.bin"
      sha256 "78417e647e79415a2db27e591ea4deac2191cdaa515630e6c7899d7a75cc79f9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.43/phosphobot-0.3.43-x86_64.bin"
      sha256 "6188a71287b50e22d61905dd181d1bc7a80f4b575859301f7ba05e58b157d292"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.43-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
