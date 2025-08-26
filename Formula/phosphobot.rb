class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.100"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.100/phosphobot-0.3.100-arm64.bin"
      sha256 "6b0028e28bfce71899416b12459e60043d2779ae75b03713535ad4340c161a75"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.100/phosphobot-0.3.100-x86_64.bin"
      sha256 "ba9ff2201254621c926d22f2a0a0e1c9e0ad01f8af5f6a09e5aa2264eef8a642"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.100-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
