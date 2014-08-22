# tidyr 0.1.0.9000

* Preserve negative signs in `extract_numeric()` (#20).

* `separate()` gains `extra` argument which lets you control what happens
  to extra pieces. The default is to throw an "error", but you can also
  "merge" or "drop".
