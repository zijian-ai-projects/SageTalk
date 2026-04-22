# SageTalk Evals

This directory contains lightweight evaluation assets for SageTalk skills.

Current scope:

- static checks for repository structure and regression-prone text patterns
- manual conversation cases for judging immersive output quality

Run static checks from the repository root:

```bash
sh evals/check-static.sh
```

Manual evals are in `immersive-conversation.md`. They should be run after changing `sage-talk`,
`sage-confucius`, `sage-mencius`, `sage-laozi`, `sage-zhuangzi`, `sage-hanfeizi`, `sage-sunzi`,
`sage-mozi`, `sage-wang-yangming`, or any future leaf skill's output protocol.

## What These Evals Protect

- implemented/scaffold registry status stays accurate
- router files do not become a persona source of truth
- immersive examples do not reintroduce report labels such as "今言之" or "现代解释"
- implemented leaf skills keep required structure
- Confucius, Mencius, Laozi, Zhuangzi, Han Feizi, Sunzi, Mozi, and Wang Yangming remain visibly
  different in questions and style
