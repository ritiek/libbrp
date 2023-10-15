# libbrp

[Ballistica](https://github.com/efroemling/ballistica) engine uses Huffman coding to compress the game's
.brp replay files.

This library can decompress such compressed .brp replay files.

The code here was once a part of [bs-replay-analyzer](https://github.com/ritiek/bs-replay-analyzer) but
has since been moved to have its own separate repository.

**TODO:** Recompress any decompressed .brp replay files.

## Compiling

```bash
$ git clone https://github.com/ritiek/libbrp
$ cd ./libbrp
$ make
```

This will create static and shared library targets under under `./lib` and also compile an example which can
be found in `./examples/decompress`.

To remove build artifacts, you can run:
```bash
$ make clean
```

## Example Usage

```bash
Usage: ./examples/decompress <input_replay_file> <output_replay_file>
```
For example:
```
$ ./examples/decompress ~/.bombsquad/replays/__lastReplay.brp ~/.bombsquad/replays/decoded_last_replay.brp
```

Now you can launch the game and choose to replay `decoded_last_replay` from the Watch section and it should
play fine since the game can read both Huffman encoded replay files as well as raw replay files.

## License

[huffman.cpp](/src/huffman.cpp), [huffman.h](/src/huffman.h) are stripped off versions from the core game
([here](https://github.com/efroemling/ballistica/blob/50f91361f41c69cc4e87eeba32217ff9558ada3e/src/ballistica/base/support/huffman.cc),
and [here](https://github.com/efroemling/ballistica/blob/master/src/ballistica/base/support/huffman.h) respectively),
and are [originally licensed under MIT](https://github.com/efroemling/ballistica/blob/50f91361f41c69cc4e87eeba32217ff9558ada3e/LICENSE).

All other code in this repository is also licensed under MIT. See [LICENSE](/LICENSE) for more info.
