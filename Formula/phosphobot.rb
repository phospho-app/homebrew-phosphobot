class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.75"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.75/phosphobot-0.3.75-arm64.bin"
      sha256 "07f3c4b107c3ccf2101a78c41bcb92a9ccafb052b1b8ad4e6c7cd2c605414a6c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.75/phosphobot-0.3.75-x86_64.bin"
      sha256 "939a8c73990cb17f113fee27a8109e7e0919d3646dfd52301aa3ff6e798677df"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.75-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
