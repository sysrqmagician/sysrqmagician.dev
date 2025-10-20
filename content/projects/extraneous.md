+++
title = "extraneous"
description = "A Firefox extension adding additional features to Invidious."
date = 2024-12-31

taxonomies.kind = [
    "showcase"
]

taxonomies.tag = [
    "typescript",
    "webext"
]
+++

<figure>
  <img src="/assets/extraneous_webext_popup.png" alt="A screenshot of the extraneous web extension settings pop-up">  
  <figcaption>Extraneous Settings</figcaption>
</figure>


## Introduction
**extraneous** is a WebExtension for Firefox and its derivatives, adding several quality-of-life features to Invidious, including...
- Watched Video Markers
- Video Filtering based on Title and Duration
- DeArrow integration

## Implementation Notes
extraneous is implemented in TypeScript and built using Deno. It was my first TypeScript project as well as my first WebExtension, but I think it turned out well. Since I use it daily, I'm also updating it actively.

While building it, I stumbled upon discriminated unions:
```ts
/**
 * Types of requests that can be sent to the background script
 */
export type BackgroundRequest =
  | { type: "isWatched"; videoId: string }
  | { type: "setWatched"; videoId: string; value: boolean }
  | { type: "deArrow"; videoId: string; videoDuration: number | null };
```
I think they are a joy to use; quite similar to Rust's fat enums, though less strictly checked. Certainly an improvement over Vanilla JS. The background worker is much easier to maintain this way.

## External Links
- [GitHub repository](https://github.com/sysrqmagician/extraneous)
- [AMO Listing](https://addons.mozilla.org/en-US/firefox/addon/extraneous/)


