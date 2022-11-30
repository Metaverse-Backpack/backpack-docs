# hammerspace-me/docs

## About The Project

Hammerspace is a virtual space for all the assets that belong to you. It helps you move and express yourself in the Metaverse. Hammerspace's focus is to enable interoperability and seamlessness. This repository holds the specification and documentation of Hammerspace. Feel free to visit the [project website](https://www.hammerspace.me) or our [E2E demo](https://demo.hammerspace.me).

## Getting Started

### Installation

- Pandoc

  Install Pandoc, a universal document converter. _NOTE:_ This installation command requires [brew](https://brew.sh/) and only runs on Mac. For alternative installation targets, please visit [Installing Pandoc](https://pandoc.org/installing.html).

  ```sh
  $ brew install pandoc
  ```

- Clone the repo

  ```sh
  $ git clone https://github.com/hammerspace-me/docs.git
  ```

## Usage

The project consists of multiple components:

1. Template: An HTML and CSS template defining the look and feel of the documentation website. Located in `/template`
2. Content: A Markdown file holding the content for the documentation. Located in `index.md`
3. Compile Script: A script to convert Markdown to a single HTML page. Located in `compile.sh`

```bash
# Start the convert script
$ ./compile.sh
```

The output is generated in `/public/index.html`.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/amazing-feature`)
3. Commit your Changes (`git commit -m 'add some amazing feature'`)
4. Push to the Branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

## Contact

Benedikt Wölk - [@web3woelk](https://twitter.com/web3woelk) - benedikt.woelk@protocol.ai

Tobias Petrasch - [@TPetrasch](https://twitter.com/TPetrasch) - tobias.petrasch@protocol.ai

## Acknowledgments

- [Protocol Labs](https://www.protocol.ai)
