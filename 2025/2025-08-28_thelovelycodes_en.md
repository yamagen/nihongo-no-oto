## Dumb Development and Orphanated Codes

### Date: 2025-08-27

### Last updated: 2025/08/27-10:36:00

---

### Summary

Security has become a convenient excuse for blind countermeasures that disregard thoughtful design and expressive intent. The indiscriminate use of `htmlspecialchars()`, the mindless repetition of escape routines—these are the signs of code written without thought or love. This record critically examines a development culture in which developers stop thinking, and in which care for user experience and architectural philosophy is all but absent.

---

### Main Text

#### The Magic Words: "Because Security"

In web development, the phrase "we escape for security" often serves as a trigger to shut down all further thought. Especially when `htmlspecialchars()` is applied indiscriminately to all output, developers get the comforting illusion of safety without asking *why* escaping is needed, *when* it is needed, and *who* the intended readers are.

#### Who Is This Code For?

* HTML like `<kbd>ESC</kbd>` is part of a well-considered document structure—an act of care for the user.
* But in fear of "XSS risks," such expression is banned outright by code that is **hostile to user experience**.
* Security and expression are not a trade-off; **context-aware design** is what makes code loving.

#### The Habit of "Just Escape Everything"

In many vendor-driven development environments, "always escape everything" has become a norm—and often ends up as an item in a formal specification. But "just escape it" may be a form of **insurance**, not a form of **thinking**. A development culture that treats security like a religion, outsourcing judgment to checklists and third parties, is the real issue.

#### Toward Code Written with Love

* Be conscious of the output context: is it HTML? JSON?
* Think about who will read it, and what message it conveys
* Cultivate the intelligence and responsibility to decide *when* escaping is appropriate
* Sometimes, *not* escaping is the more expressive and ethical choice
* Security is a **means**, not an **end**

#### Conclusion

This is the reality of what large, profitable web development firms produce.

Code written without thought by someone—passed on to juniors who are told nothing but:

> "Just slap a `htmlspecialchars()` on it."

---

### Notes, Tags, and Related Projects

* Tags: `#nihongo-no-oto`, `#ethics-in-code`, `#web-security`, `#escape-cult`, `#loving-design`
* Related projects:

  * AEAD: An Expression A Day
  * LEAP: Lightweight Exam Assistant Platform
  * k2g: Classical Japanese Grammar Parsing & Glossing Project

---
