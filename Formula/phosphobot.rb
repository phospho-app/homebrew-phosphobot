class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.131"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.131/phosphobot-0.2.131-arm64.bin"
      sha256 "3e45024abe041f690ad19a67f2648a7184cdd409f511dd6f5b3bba4b661ee95a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.131/phosphobot-0.2.131-x86_64.bin"
      sha256 "b8dc46772bae4ed0be2d5c9546fb32b55e1d29f25cb63fecbf36070bdb4f9888"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.131-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
