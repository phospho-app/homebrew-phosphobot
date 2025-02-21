class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.59/phosphobot.bin"
  sha256 "a6953dfcb9293f41194a5f2b33c1c50b21c93bbc493a9b5eb87ad15091db18f4"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
