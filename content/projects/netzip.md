+++
title = "NetZip"
description = "A library and CLI partially parsing ZIP files over HTTP to save bandwidth."
date = 2025-04-05

taxonomies.kind = [
    "showcase"
]

taxonomies.tag = [
    "rust",
    "cli",
    "library"
]
+++


## Introduction
**NetZip** is a Rust library and CLI application that uses HTTP Ranged Requests to downloads only the required parts of a ZIP file, saving you bandwidth when interacting with large archives.
You don't need to download a 10GB ZIP file if you only want a couple MBs worth of files from it.

## Implementation Notes
NetZip has three components
- netzip_parser: A barebones parser for the ZIP format.
- netzip: The primary library crate. Uses reqwest to send requests and netzip_parser to parse the response, then decompresses it, if necessary.
- netzip_cli: Demo CLI built using the netzip crate.

It downloads a file as follows:
1. Fetch the End Of Central Directory record, located at the end of the file.
    - Contains the location and size of the Central Directory
1. Fetch the Central Directory
    - Contains metadata of all files in the archive, including size, compression type and header location
1. Fetch the requested file's Local File Header
1. Fetch the file's contents, which immediately follow the Local File Header
1. Decompress the file, if necessary 

## Usage Example
```
$ netzip list "https://sysrqmagician.dev/assets/netzip_example.zip"
+----------------------+-----------------+-------------------+
| Path                 | Compressed Size | Uncompressed Size |
+============================================================+
| another_file.bin     | 0.00 KiB        | 0.00 KiB          |
| demo.txt             | 0.02 KiB        | 0.02 KiB          |
| yet_another_file.bin | 0.00 KiB        | 0.00 KiB          |
+----------------------+-----------------+-------------------+

$ netzip extract "https://sysrqmagician.dev/assets/netzip_example.zip" demo.txt
  Downloaded 1 files.
```

I'm still hosting the file under: ``https://sysrqmagician.dev/assets/netzip_example.zip``.

Feel free to try it out yourself!

## External Links
- [GitHub Repository](https://github.com/sysrqmagician/netzip)
- [Crates.io Listing](https://crates.io/crates/netzip)
