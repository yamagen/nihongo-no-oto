<!--
Title: Two Modes of Language Use Observed in LLM Responses
Dropbox/pub/nihongo-no-oto/2026/2026-03-14-llm-responses-en.md
-->

# Two Modes of Language Production in LLM Responses

Last change: 2026/03/15

Hiroshi Yamamoto, Ph.D.
Institute for Liberal Arts, Tokyo Institute of Technology

---

## 1. The Initial Observation: Differences in Response Style

During interactions with large language models (LLMs), an interesting phenomenon emerged: the presence of "two response modes."
This observation arose from a discussion triggered by the function in ChatGPT that presents two alternative answers, labeled Response 1 and Response 2.

When the same question was asked, the model often generated two distinct styles of responses: a short, empathetic response and a longer, analytical response.

When the differences between these responses are organized, the following contrasts become apparent.

Table 1: Characteristics of LLM Response Styles

| Response characteristic | Type           |
| ----------------------- | -------------- |
| Short explanation       | Immediate      |
| Long explanation        | Analytical     |
| Empathetic response     | Conversational |
| Analytical response     | Structural     |
| Conversational text     | Chain-like     |
| Structured text         | Hierarchical   |

The important point is that this difference is not merely a matter of sentence length.

A related concept in cognitive science is the distinction between intuitive processing and deliberative processing. These two processing styles correspond closely to the differences observed in LLM response styles. Daniel Kahneman's distinction between System 1 and System 2 expresses a similar idea (Kahneman 2011). Such models are widely studied in cognitive science under the framework of dual-process theory (Evans & Stanovich 2013).

However, these theories have primarily been used to study decision-making and judgment, and have rarely been discussed as structures of language generation.

---

## 2. Do LLMs Implement Fast and Slow Systems?

LLMs do not explicitly implement a fast/slow architecture corresponding to a fast system and a slow system.
However, research on LLMs has reported differences in generation style, such as chain-of-thought prompting, which produces reasoning processes step by step (Wei et al. 2023).

LLMs generate text through probabilistic prediction based on massive amounts of training data. These training datasets include a wide range of textual styles: conversation, academic writing, and explanatory prose. As a result, both conversational generation and analytical generation naturally appear as two styles of language use.

In this sense, the two-layer structure commonly found in practical systems may naturally emerge in LLM output.

Interestingly, similar dual structures appear implicitly in many fields, such as software user interface design, educational design, and human factors engineering. In many cases, systems are designed with two layers: intuitive operation and analytical configuration.

However, these are often treated not as explicit theories but as empirical design principles.

---

## 3. Bias in Language Education and the Role of Time Scale

In language education, emphasis is typically placed on grammatical structure and explicit rules. The reason is simple: these elements can be explained clearly and tested systematically.

In research on language production, models have been proposed that treat speech generation as a sequence of multiple processing stages (Levelt 1989). These studies suggest that actual language use involves processes operating on different time scales.

On the other hand, immediate language use and conversational chains are difficult to systematize, and therefore they rarely become the central focus of language education.

For this reason, the introduction of the Process Grammar Model (PGM) is proposed (Yamamoto 2025). In PGM, two forms of language use are distinguished: Immediate Grammar and Adjustive Grammar.

These two grammars are characterized by differences in time scale and structural organization (Table 2).

Table 2: Two Grammars in the Process Grammar Model

| Grammar           | Time scale | Structure |
| ----------------- | ---------- | --------- |
| Immediate Grammar | Short      | Chain     |
| Adjustive Grammar | Long       | Structure |

The differences observed in LLM response styles correspond closely to these two modes of language use.

In PGM, the essential point is not the existence of two grammars themselves, but rather the existence of language processes operating on different time scales.

For example, conversation unfolds over a short time scale, while academic writing develops over a longer time scale. The differences in LLM responses can also be understood in terms of this difference in temporal scope.

---

## 4. Conclusion

Observations of LLM responses suggest the following.

Language use involves two modes of processing: chain-like processing and structural processing. These two modes should not be regarded as opposing systems but rather as language processes operating on different time scales.

This perspective has the potential to unify three domains: linguistic theory, language education, and AI-generated language.

In this sense, the observed differences in LLM responses may provide important evidence for a two-layer organization of language production of a two-layer structure in human language production.

---

## References

1. Kahneman, D. (2011). _Thinking, Fast and Slow_. Farrar, Straus and Giroux.
2. Evans, J. St. B. T., & Stanovich, K. E. (2013). Dual-process theories of higher cognition: Advancing the debate. _Perspectives on Psychological Science_, 8(3), 223-241.
3. Wei, J., Wang, X., Schuurmans, D., Bosma, M., Ichter, B., Xia, F., Chi, E., Le, Q., & Zhou, D. (2023). Chain-of-Thought Prompting Elicits Reasoning in Large Language Models. _arXiv preprint arXiv:2201.11903_.
4. Levelt, W. J. M. (1989). _Speaking: From Intention to Articulation_. MIT Press.
5. Yamamoto, H. (2025). _Process Grammar Model (Version 1.0.11)_. Zenodo. [https://doi.org/10.5281/zenodo.15613134](https://doi.org/10.5281/zenodo.15613134)
