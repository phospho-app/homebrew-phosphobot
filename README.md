# homebrew-phosphobot

A community-driven platform for robotics enthusiasts to share and explore creative projects built with the phospho Junior Dev Kit.

<div align="center">

<a href="https://www.ycombinator.com/companies/phospho"><img src="https://img.shields.io/badge/Y%20Combinator-W24-orange?style=flat-square" alt="Y Combinator W24"></a>
<a href="https://discord.gg/cbkggY6NSK"><img src="https://img.shields.io/discord/1106594252043071509" alt="phospho discord"></a>

</div>

This is the server side implementation of the phosphobot robotics software.
Please check [the phosphobot repo](https://github.com/phospho-app/phosphobot) to find the client side implementation.

This is initially meant to be run on a raspberry pi but can be run through brew on a mac.
Please find instructions below.

If you wish to access this software on another platform or are facing difficulty, please reach out at contact@phospho.ai

## How to install phosphobot with brew

```bash
brew tap phospho-app/homebrew-phosphobot
brew install phosphobot
```

You can verify the installation with

```bash
phosphobot --version
```

To launch the app just do

```bash
phosphobot run
```

You can exit at any time with ctrl+c
