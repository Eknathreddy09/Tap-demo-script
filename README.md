[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

# Tanzu Application Platform Demo script

## Prerequisites
- [SDKMan](https://sdkman.io/install)
  > i.e. `curl -s "https://get.sdkman.io" | bash`
- [Httpie](https://httpie.io/) needs to be in the path
  > i.e. `brew install httpie`
- bc, pv, zip, unzip, gcc, zlib1g-dev
  > i.e. `sudo apt install bc, pv, zip, unzip, gcc, zlib1g-dev -y`
- [Vendir](https://carvel.dev/vendir/)
  > i.e. `brew tap carvel-dev/carvel && brew install vendir`

## Cluster Access

- Install TAP (full profile) in tap-install namespace or request access for Shared TAP Cluster
- Change the context to TAP cluster

## Quick Start
```bash
./demo.sh
```

## Attributions
- [Demo Magic](https://github.com/paxtonhare/demo-magic) is pulled via `vendir sync`

## Related Videos

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[forks-shield]: https://img.shields.io/github/forks/eknathreddy09/Tap-demo-script.svg?style=for-the-badge
[forks-url]: https://github.com/Eknathreddy09/Tap-demo-script/forks
[stars-shield]: https://img.shields.io/github/stars/Eknathreddy09/Tap-demo-script.svg?style=for-the-badge
[stars-url]: https://github.com/Eknathreddy09/Tap-demo-script/stargazers
[issues-shield]: https://img.shields.io/github/issues/Eknathreddy09/Tap-demo-script.svg?style=for-the-badge
[issues-url]: https://github.com/Eknathreddy09/Tap-demo-script/issues
