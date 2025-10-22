+++
title = "markovgen"
draft = true
description = "Name generation using markov chains, fast."
date = 2024-05-15

taxonomies.kind = [
    "showcase"
]

taxonomies.tag = [
    "rust",
    "library",
    "cli",
]

+++

## Introduction
**markovgen** is a Rust library for generating text sequences using markov chains. It works by building a graph from a text dataset and then sampling it. The graph structure created in the 'compilation' step is simplified down to a simple array containing references to other elements and alongside pre-computed values, making traversal very fast.

The crate comes with an example CLI application, **markovcli**.

## Implementation Notes

This was my first proper Rust project. I wanted to build a name generator using Markov chains, which is why it only supports constructing sequences out of individual chars. I might revisit it and implement other kinds of 'components' in the future.

## External Links

- [GitHub Repository](https://github.com/sysrqmagician/markovgen)
- [Crates.io Listing](https://crates.io/crates/markovgen)
