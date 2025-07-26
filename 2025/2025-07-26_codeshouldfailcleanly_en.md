## Code Should Fail Cleanly — On Explicitness and Responsibility in Design


Last change: 2025/07/27-00:30:42.

---

### Summary

While refining LEAP’s email verification system, we confronted a common programming temptation: adding “failsafes” like `rtrim()` or `trim()` to smooth over assumptions.
Such choices seem helpful but in fact erode design clarity.
This article argues that a good program should not keep running when its assumptions are wrong.
Instead, it must fail explicitly—and configuration must be designed with precision, not patched defensively.

---

### Main Text

While debugging the token logic in LEAP on July 26, 2025, the following line drew attention:

```php
$dataDir = rtrim($config['token_data_dir'], '/') . '/';
```

Why was `rtrim()` needed? Because someone might forget to end the directory path with a slash.

But that is not the program's job to fix.
Such code means: “Whatever mistake is made, we’ll try to make it work.”
This obscures the contract between `config.php` and the program logic.

Instead, the right contract is:

```php
// config.php
// All paths must end with a trailing slash.
'token_data_dir' => __DIR__ . '/data/tokens/',
```

The program should trust this contract.
And if the trust is broken, it should refuse to run:

```php
if (substr($config['token_data_dir'], -1) !== '/') {
    throw new RuntimeException("token_data_dir must end with a trailing slash.");
}
```

But even this check reveals a weakness: we are validating something we should not need to validate.
A better design eliminates the ambiguity upfront—by writing clear configuration and trusting it.

---

### Against trim(): Cleaning Up the Wrong Mess

This silent forgiveness also appears in the widespread use of `trim()`:

```php
$json = file_get_contents($tokenFile);
if ($json === false || trim($json) === '') {
    echo "Failed to read token file.";
    exit;
}
```

Or:

```php
$token = trim($token);
```

These are defensive acts meant to sanitize—but sanitize what?
If `file_get_contents()` might return extra whitespace, shouldn’t we fix the file content instead?

Trimming lets errors sneak in quietly, and tells developers: “Don’t worry, we’ll clean up behind you.”
But this undermines the responsibility of each component in the system.
If invalid data is passed, the system should fail—not cope.

---

### Responsibility and Hypothesis

Every additional `rtrim()`, every `trim()` is a kind of dishonesty.
It says: “We don’t quite trust our inputs, and we’d rather cover it up than face a failure.”

Instead, programmers should follow a stricter discipline:\\

1. Make a single change.
2. Test the hypothesis.
3. If it fails, roll it back.

This method of working is not harsh—it is scientific.
It teaches us, and it teaches our students.
Code should not survive under bad logic, because people learn best from failure that cannot be ignored.

---

### Conclusion

Software should run only when its logic is sound.
When assumptions are violated, it must stop.
This isn't severity—it is clarity. It is respect for responsibility.

Patching over flaws with `trim()` or `rtrim()` is not robustness.
It is fear of failure, and it weakens the whole system.

We must create a culture of programming that favors clarity over convenience, and correctness over coverage.

---

### Notes, Tags, Related Projects

* Related Projects: LEAP, p-leap
* Tags: programming education, exception handling, robustness, explicit design, configuration discipline

