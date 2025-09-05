class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.112"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.112/phosphobot-0.3.112-arm64.bin"
      sha256 "823d5baae4e5aa396e3bf659bed9979f6e1525d9ad6b7c74dbc7001d359ca7b9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.112/phosphobot-0.3.112-x86_64.bin"
      sha256 "a0febd498cb62d724052d7f144e20547d6570da7fe8c7eb92db3166b89d32f1d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.112-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
