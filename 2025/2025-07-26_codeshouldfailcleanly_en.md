## Code Should Fail Cleanly — Design by Explicitness, Not Tolerance

Last change: 2025/07/27-00:07:27.

---

### Summary

Through the process of refining LEAP's email verification system, we re-examined the dangers of tolerant coding and reaffirmed the distinction between "working" and "correct."&#x20;
Expressions like `rtrim()` for automatic correction, `trim()` for vague validation, and excessive debug `echo`s are all seemingly harmless practices that, in truth, undermine design clarity and obscure responsibility.&#x20;
This article asserts that "failing correctly" is the hallmark of conscientious design, and a core principle that should be taught in programming education.

---

### Main Text

On July 26, 2025, I worked on confirming and fixing the email verification mechanism of LEAP. While investigating why token files weren't being saved properly on the plover server, I encountered several lines of code that seemed trivial at first—but in fact revealed a deep flaw in the design mindset.

For example, take the line:

```php
$dataDir = rtrim($config['token_data_dir'], '/') . '/';
```

This implies:

* "Whether or not there's a trailing slash is up to the user."
* "We'll silently fix it for you in the code."

This looks like a user-friendly design but actually hides the boundary of responsibility and leads to design ambiguity. If `token_data_dir` must end with a slash, that rule should be made explicit in the configuration and enforced strictly in the code. It is better to fail clearly and early:

```php
if (substr($config['token_data_dir'], -1) !== '/') {
    throw new RuntimeException("token_data_dir must end with a '/' character.");
}
```

This isn't about "ensuring it works"—it's about enforcing a design contract. If the logic is wrong, the program should not run. That is an ethical stance in development.

Similarly, lines like `$token = trim($token);` or `trim($json)` reflect an implicit "it's probably not clean, but let’s allow it" mindset. But the correct response should be to ask, "Why is the input malformed in the first place?" and, more importantly, "Is it acceptable to allow it?" Permitting ambiguous data weakens the integrity of the system boundary.

---

### Minor Safeguards Can Cripple Whole Systems

A program must behave exactly as designed—and no more. That’s what it means to design.&#x20;
If an unexpected situation arises, the program should stop immediately and loudly. By halting, it notifies the developer or maintainer: “This is not okay.”

Code that quietly proceeds despite errors will inevitably misbehave. It will accept invalid inputs, behave differently than intended, and when something goes wrong, it will be impossible to trace why.

This is why the principle of hypothesis-driven development is essential: make one change per hypothesis, test it, and if it fails, revert. Using defensive code to gloss over errors is tantamount to abandoning design.

Phrases like “let’s just trim() it for safety” or “add rtrim() and it’ll be fine” are seductive but dangerous. What begins as a helpful line becomes a burdensome relic—hard to trace, hard to justify.

---

### Conclusion

“Code should fail cleanly.” This is not just a technical guideline but an educational and ethical one, something to be passed on to the next generation of students and developers.&#x20;
Rather than just making code that "works," we must aim for code that works **as intended**—and halts when it doesn’t.&#x20;
Only then can we foster a culture of deliberate and explicit software design.

---

### Notes, Tags, and Related Projects

* Related Projects: LEAP, p-leap
* Tags: Programming education, exception design, robustness, debugging, explicit design
