## Code Should Fail Clearly — On Explicitness and Responsibility in Design

Last change: 2025/07/27-17:52:51. 

---

### Summary

While refining the email verification system for LEAP, we encountered ambiguity caused by “protective code.”
Functions like `rtrim()` and `trim()` may appear to offer safety, but in fact they obscure design flaws and deflect responsibility.
This article argues that robust programming is not about making things work, but about making things *correct*, and ensuring that violations of assumptions fail fast and visibly.

---

### Main Text

On July 26, 2025, while debugging LEAP’s token handling logic on the plover server, we identified a questionable line of code:

```php
$dataDir = rtrim($config['token_data_dir'], '/') . '/';
```

Why was `rtrim()` used here?
Because the configuration might “accidentally” omit the trailing slash.

But that’s not the program’s job to fix.
This line assumes mistakes and silently corrects them, weakening the contract between code and configuration.
It sacrifices clarity in favor of leniency, which ultimately blurs the boundary of responsibility.

Instead, the configuration should be explicit:

```php
// config.php
// Directory paths must end with a trailing slash.
'token_data_dir' => __DIR__ . '/data/tokens/',
```

And the program should assume this contract, and halt clearly if it is violated:

```php
if (substr($config['token_data_dir'], -1) !== '/') {
    throw new RuntimeException("token_data_dir must end with a trailing slash.");
}
```

Even this kind of check is arguably a failure in design.
If the configuration is unambiguous by design, such verification wouldn’t be necessary in the first place.
We should not try to *prevent* failure—we should *design out* the possibility of failure.

---

### The Deception of "Cleaning Up" with trim()

A similar problem arises with `trim()`:

```php
$json = file_get_contents($tokenFile);
if ($json === false || trim($json) === '') {
    echo "Failed to read token file.";
    exit;
}
```

Or more subtly:

```php
$token = trim($token);
```

Such lines are written as a “just in case” safety measure.
But if bad data is entering the system, it is the data source—not the consumer—that must be fixed.

`trim()` hides the problem and gives the false impression that everything is fine.
In doing so, it undermines trust in the data flow and muddies the separation of responsibility.

Good design begins with a contract:
*“This input shall be X.”*
If X is not provided, fail fast—and fail clearly.

---

### The Courage to Fail, the Discipline of Hypothesis

Using `trim()` or `rtrim()` is a kind of lie.
It implies that we can quietly fix mistakes without reexamining their source.
But true programming is scientific and deliberate.

1. Form a hypothesis.
2. Change one thing.
3. If it fails, revert.

This loop is how we design, how we learn, and how we grow.
“Protective code” short-circuits this process and robs us of the opportunity to learn from mistakes.

---

### Reflections on Culture and Context

It is likely that many working programmers have focused on keeping things from breaking, on simply “making it work.”
As long as the system runs, design issues stay hidden—and with limited time and pressure from deadlines, there’s no room to rethink the fundamentals.
Small bugs get wrapped in “insurance,” and the codebase eventually becomes unmaintainable.

From a perspective that values logic, verification, and educational clarity, the question “why didn’t it fail?” always lingers.
And because large language models like AI learn from existing public code, they often inherit this same behavior—reflexively suggesting “let’s just use `rtrim()`” or “add an `echo` to check.”
This isn’t best practice. It’s the reflection of an unhealthy coding culture.

That is why the following attitude is so important:

> Don’t ask “does it work?” — ask “is this how it *should* work?” And if not, make sure it fails.

This isn’t merely a matter of programming technique.
It’s a matter of **design ethics**—something we must pass on to the next generation.

---

### Notes, Tags, Related Projects

* Related Projects: LEAP, p-leap
* Tags: programming education, exception handling, robustness, debugging, explicit design, configuration discipline


