# Utilities

This folder contains simple utilities, that suppose to make data entry and analysis simpler. The utilities are at different stages of development and are not guaranteed to function as advertised, expected, or at all.

Currently there are:

## CHAPTER_MAKER

![](../media/automation_2x.png)
_source [xkcd](https://xkcd.com/1319/)_

... and this is exactly what I did here -- this is a small utility, which will scan your cypher file for chapters in the following format:

```
// Not captured
// {part: DECLARE} <- this will get caputred as **part** and **"I"**
    // {chapter: 1} <- this will get caputred as **chapter** and **1**
    (something:Something {name: "ONE") <- the part and chapter are inserted
    // {chapter: 2}
    (nothing:Something {name: "NIL"})
// {part: CONNECT}
    // {chapter: 3}
    (nothing)-[:NOT_FOLLOWED_BY]->(something)
```

and insert the chapter formation into properties like that:

```
// Not captured
// {part: DECLARE} <- this will get caputred as **part** and **"I"**
    // {chapter: 1} <- this will get caputred as **chapter** and **1**
    (something:Something {name: "ONE", part: "DECLARE", chapter: 1) <- the part and chapter are inserted
    // {chapter: 2}
    (nothing:Something {name: "NIL", part: "DECLARE", chapter: 2})
// {part: CONNECT}
    // {chapter: 3}
    (nothing)-[:NOT_FOLLOWED_BY {part: "CONNECT", chapter: 3}]->(something)
```

The format of the chapter declaration is `// {}'. Tabs and spaces are irrelevant. Only the values within the first curly brackets in the line are captured.

The chapter values are compoundable and replaceable if the key is the same. No automatic number increase is enabled, since it presents more issues than solution. The magic is brought to the minimum.

The "ongoing development" stage is definitely on, as I am trying to rewrite the whole thing is some niche language like [Nim](https://nim-lang.org/) or [V](https://vlang.io/)
