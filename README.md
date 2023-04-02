Message service
===============

Splits an input text string into multiple messages fixed length with a numbered header

There are two different implementations: `FixedHeader` and `FlexibleHeader` (via recursion)

Checkout `lib` and `spec` folder for more details

Smoke
-----
```
git clone https://github.com/dmproger/messages.git
cd messages
bundle

rspec
```

bundle version is 2.4.7

Notes
-----
This testcase was given at [Современные технологии](https://совтех.рф/) interview during live coding session (absolute useless format for checking developer skills, in my opinion).

Later, i rewrote it in a normal mode with two implementations and specs
