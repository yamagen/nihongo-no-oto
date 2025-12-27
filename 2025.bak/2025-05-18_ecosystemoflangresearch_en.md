# Ecosystem for Language Research

### Date: 2025-05-17

---

### Summary

How should we describe, preserve, share, and reuse the structure of language and literature? The fundamental difference in design philosophy can perhaps be understood through two contrasting structural concepts: the “Monolith” and the “Ecosystem.” This essay proposes an ecosystem-based approach to structural description—one that is decentralized, loosely coupled, and extensible—and explores its conceptual and technical merits.

---

### Main Text

“You don't need to gloss this word—it’s already in UniDic.”

“If a structure can’t be parsed by a morphological analyzer, it isn’t valid research material.”

“Descriptions that don’t follow an established dictionary system are nonstandard.”

These are comments I still hear today. But such remarks aren’t really about tools or norms—they’re about the design of description itself. A centralized description system—where morphological analyzers, dictionaries, corpora, and annotation tools are all fused into one—resembles a monolith: rigid, difficult to modify, and closed to distributed participation.

By contrast, a structure that separates vocabulary systems, grammatical description, annotation layers, analytical tools, and visualization scripts, while ensuring they can interoperate as needed—this is what I call an ecosystem-oriented approach to language description.

With this philosophy in mind, I’ve adopted a two-level structure called `phrase-gloss`, combining standard Leipzig Glossing Rules with extended non-LGR abbreviations, and store all data in JSON. Abbreviation consistency is checked using a self-developed tool called `gloss-linter`. Each dataset—like `ise.json` and `tosa.json`—is modularized. The morphological analyzer `k2g` supports parsing, and `gloss-rewriter` assists with term conversion.

All of these components are designed as parts of an ecosystem:

- Each can be built and modified independently
- They can interoperate with other components as needed
- Each has semantic integrity on its own, yet can function as part of a larger whole

This flexibility and reusability represent what I see as the future of linguistic description. Description should not be a subordinate to analysis; it should be a creative and interpretive endeavor in its own right. For that, we need structures that can be self-designed, tested, published, and improved.

Even without access to official linguistic resources, meaningful research is possible. The legitimacy of a description lies not in the tools or institutions behind it, but in its structural transparency and reusability.

---

### Keywords

Monolith, Ecosystem, Structural Description, Gloss, Gloss-Linter, Decentralization, Narrative Syntax, Immediate Grammar, Grammatical Design Philosophy
