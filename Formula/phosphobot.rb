class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.33"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.33/phosphobot-0.3.33-arm64.bin"
      sha256 "2af35580cc3590b61b282728871e7a94245f0355f1fd020349329d6c1c9246a2"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.33/phosphobot-0.3.33-x86_64.bin"
      sha256 "14e6928f71874531abaf6949f7a6b49bb4d8384484be4e23be12bae830c4967f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.33-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
