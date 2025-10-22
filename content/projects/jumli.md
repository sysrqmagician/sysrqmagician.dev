+++
title = "JuMLi: Judge My List"
description = "A modlist checking tool for RimWorld."
date = 2025-09-09

taxonomies.kind = [
    "showcase"
]

taxonomies.tag = [
    "rust",
    "ssg",
    "webdev"
]

+++

## Introduction
<figure>
<img src="/assets/jumli_home.png" alt="A screenshot of JuMLi's interface">
<figcaption>The main interface</figcaption>
</figure>

**JuMLi** is a web-based modlist checking tool for RimWorld. It compares the player's mods against a database, containing notices associated with mod identifiers. It's a static site automatically updated every 24 hours.

At the time of writing, it used the following data:
- The *Use This Instead* mod's replacement definitions
- Local Datasets
    - An up-to-date subset of the Dubs Mods Community "Shitlist"
    - Common advice given in the performance help channel of the Dubs Mods Discord, including recommended settings and slow or unstable mods
    - Known bugs (e.g. the Odyssey Job Driver performance regression)

## Implementation Notes

<figure>
<img src="/assets/jumli_example_notices.png" alt="A screenshot of JuMLi's report on RimWorld Odyssey and the Slower Pawn Tick Rate mod, showing their identifiers and notices.">
<figcaption>Example records</figcaption>
</figure>

JuMLi is a static site rebuilt every 24 hours using a custom static site generator, *jumli_gen*. 

jumli_gen fetches the latest data from the following sources:
- The JuMLi monorepo, which contains custom datasets
- The [Use This Instead](https://github.com/emipa606/UseThisInstead) repo, which contains community-submitted alternatives to broken/outdated mods defined in XML documents

Each source is parsed and brought into a common format, before the mod records are consolidated based on unique identifiers: the Steam Workshop ID and Package ID.[^fork-ids]

An index for the frontend is built, mapping these identifiers to an internal id. For each mod, the record is serialized to JSON and an HTML report is generated.

### Why a static site?
If JuMLi had a backend, I would have to rent a server in order to run it. This way, it can be hosted for free using GitHub Pages, Cloudflare Pages or similar. Even if the aforementioned companies decide to cut down on free services in the future, a basic web hosting package that gives you FTP access and a managed Apache server is much cheaper than any VPS.

## External Links
- [Main JuMLi instance](https://jumli.sysrqmagician.dev/)
- [GitHub Repository](https://github.com/sysrqmagician/jumli)
- [RimWorld Base article](https://rimworldbase.com/rimworld-guides/jumli-judge-my-list/) (initially submitted by me)

---

[^fork-ids]: After implementing this, I found out that a lot of modders publishing updated forks of other mods just reuse the original package ID. This doesn't just cause issues for JuMLi; it's a terrible practice, as, even disregarding that the *unique* ID should be unique, RimWorld's mod loading will break if mods with duplicate IDs are installed. To mitigate this, the Use This Instead source drops the package ID from its records if the replacement's ID is unchanged.
