We expect 3 reverse dependency failures:
- faux
- ggpubr
- wpa

We have sent each of these a pull request containing a backwards compatible
patch. See https://github.com/tidyverse/tidyr/issues/1453 for more information.

faux and ggpubr have had at least two weeks to update their package. wpa was
sent a pull request today, as their package breakage wasn't caught until today,
but we still request that tidyr be accepted in spite of this.
