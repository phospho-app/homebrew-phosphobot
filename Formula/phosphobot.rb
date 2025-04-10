class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.123"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.123/phosphobot-0.2.123-arm64.bin"
      sha256 "222bd9e77da1c1c7d295f70cc0944ef9df5422035f8758081a7043c8a6e597a6"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.123/phosphobot-0.2.123-x86_64.bin"
      sha256 "7f64ef25f657ba070926a5045c3e5a4db479d69bef955fafb42c4eeab550bc9f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.123-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
