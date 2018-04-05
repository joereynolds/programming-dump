# Dead CSS

Naively detects dead CSS.


# Notes

Uses ripgrep `rg` in the background. It goes through a given css file and finds all ids and classes and greps for those (and some other clever stuff). If no matches are found, it's probably not used.

Note that this tool can't detect all use cases. For example, string-concatting a selector in JS will probably bypass the tool.
