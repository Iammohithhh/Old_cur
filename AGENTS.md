# Curiosophy: instructions for AI assistants

This repo is **Curiosophy**, a personal learning notebook published with Quartz v5 to
https://iammohithhh.github.io/Curiosophy. The author writes rough material anywhere (Google Docs,
Notion, chats, paper notes). Your job is to turn that material into clean, honest notebook pages.

## Layout
The author is keeping the structure deliberately small for now and will reorganise later. Don't add new top-level
sections unless asked.
- `content/`: the published site.
  - `speed-accuracy-barrier/`: **Documenting the Speed–Accuracy Barrier challenge** (Discovered Materials).
    `index.md` is the main write-up: the challenge, the baseline, observations, open questions, a list of subpages
    and a dated journal (newest first). Anything interesting the author finds becomes a subpage in this folder,
    linked from the "Subpages" section of `index.md`. New findings also get a line in the journal.
  - `papers/`: **Papers: my understanding.** One page per paper, made from `templates/paper.md`. These exist so the
    author can skim a page instead of rereading the paper, so keep them skimmable: TL;DR, problem, key idea,
    how it works, results, limitations, my take. Create a paper page only when the author sends notes on that paper.
  - `reading-lists/`: curated lists of papers to read.
- Every folder has a short `index.md`. Quartz lists a folder's pages automatically, so don't maintain lists by hand
  (the "Subpages" list on the challenge write-up is the one exception).
- No tag system for now. Keep it simple.
- `<folder>/images/`: images for that folder.
- `content/log.md`: one line per session, newest first.
- `content/inbox/`: raw material, **git-ignored and never published** (it's in Quartz's `ignorePatterns`). Originals go to `content/inbox/_processed/` once processed.
- `templates/entry.md`: template for question pages. `templates/paper.md`: template for paper pages.
- `site/quartz.config.yaml`: site settings (title, theme, plugins). `site/build.sh`: downloads Quartz (not stored in this repo) and builds the site. Don't edit these unless asked, and never add Quartz's own files back into the repo.

## "Process the inbox"
For each file in `content/inbox/` (skip `README.md` and `_processed/`):
1. Read it fully. Work out the question or questions it's about.
2. If an existing page already covers the question, **extend that page** rather than creating a duplicate.
   Otherwise: notes about a paper go in `content/papers/<kebab-case-paper-name>.md` (from `templates/paper.md`);
   notes from working on the challenge go in `content/speed-accuracy-barrier/<kebab-case-question>.md`
   (from `templates/entry.md`), linked from the challenge write-up. If neither fits, ask the author where it goes.
3. Keep the author's ideas, examples and framing. Improve clarity, structure and math (KaTeX: `$...$`, `$$...$$`).
   Don't pad the page with generic textbook material the author didn't ask for.
4. Set the frontmatter honestly:
   - `status: ai-draft` always. **Never set `reviewed`**. Only the author does that.
   - `code: ran` only if you actually executed the code and pasted the real output. Otherwise use `untested`, or `none`.
   - `sources`: only references you have verified exist (DOI or arXiv). Mark anything unverified as `(unverified)`.
5. End the page with a `> [!todo] Things to check` callout listing the claims the author should verify.
6. Link related pages with `[[wikilinks]]`, including between the challenge pages and paper pages.
7. Images: save them in that folder's `images/` folder and embed them with `![[file.png]]`.
8. Move the original to `content/inbox/_processed/YYYY-MM-DD-<original-name>`.
9. Add one line to the top of the list in `content/log.md`.
10. Run `site/build.sh` and fix any errors. Then report what changed and which claims need checking.

## Notes pasted straight into the chat (e.g. from a phone)
The author often works from a phone in a cloud session, where `content/inbox/` doesn't exist.
Treat notes pasted or dictated into the chat exactly like an inbox file: follow steps 1–7, 9 and 10 above.
There's no original file to move, and the raw notes are never saved to the repo.

## "Publish"
When the author says "publish", commit with a short message and push to `main`. That deploys the site.
If the environment only allows pushing to a branch, push the branch, open a pull request, and tell the author
to merge it (they can do that from the GitHub mobile app).

## Rules
- **Don't commit or push** unless the author asks. Pushing to `main` publishes the site.
- Never add PDFs of papers or long copied passages. Link the DOI or arXiv page instead.
- Never copy the author's private details into pages.
- Prefer one question per page, phrased as a question.
