# Curiosophy: instructions for AI assistants

This repo is **Curiosophy**, a personal learning notebook published with Quartz v5 to
https://iammohithhh.github.io/Curiosophy. The author writes rough material anywhere (Google Docs,
Notion, chats, paper notes). Your job is to turn that material into clean, honest notebook pages.

## Layout
- `content/`: the published site, organised into shelves, each with subsections:
  - `ai/`: `machine-learning/`, `llms/`, `rl/`, `world-models/`
  - `science/`: `dft/`, `atomistic-simulation/`, `electrochemistry/`, `batteries/`, `energy/`
  - `ai-x-science/`: `mlips/` (the current main focus)
  - `math/`
  - `others/`: anything that doesn't fit elsewhere
  - `reading-lists/`
- Every folder has a short `index.md`. Quartz lists a folder's pages automatically, so don't maintain lists by hand.
- No tag system for now. Keep it simple.
- `<subsection>/images/`: images for that subsection.
- `content/log.md`: one line per session, newest first.
- `inbox/`: raw material, **git-ignored and never published**. Originals go to `inbox/_processed/` once processed.
- `templates/entry.md`: the frontmatter and section template for new pages.
- `quartz/`, `docs/`, `quartz.config.yaml`: the Quartz engine and its configuration. Don't edit these unless asked.

## "Process the inbox"
For each file in `inbox/` (skip `README.md` and `_processed/`):
1. Read it fully. Work out the question or questions it's about.
2. If an existing page already covers the question, **extend that page** rather than creating a duplicate.
   Otherwise create `content/<shelf>/<subsection>/<kebab-case-question>.md` from `templates/entry.md`.
   If no subsection fits, put the page directly in the shelf folder, or in `others/`. Create a new subsection
   (with a one-line `index.md`) only when there are already several pages on that subject, or the author asks for one.
3. Keep the author's ideas, examples and framing. Improve clarity, structure and math (KaTeX: `$...$`, `$$...$$`).
   Don't pad the page with generic textbook material the author didn't ask for.
4. Set the frontmatter honestly:
   - `status: ai-draft` always. **Never set `reviewed`**. Only the author does that.
   - `code: ran` only if you actually executed the code and pasted the real output. Otherwise use `untested`, or `none`.
   - `sources`: only references you have verified exist (DOI or arXiv). Mark anything unverified as `(unverified)`.
5. End the page with a `> [!todo] Things to check` callout listing the claims the author should verify.
6. Link related pages with `[[wikilinks]]`, including across shelves (for example, an MLIP page linking to a DFT page).
7. Images: save them in the subsection's `images/` folder and embed them with `![[file.png]]`.
8. Move the original to `inbox/_processed/YYYY-MM-DD-<original-name>`.
9. Add one line to the top of the list in `content/log.md`.
10. Run `npx quartz build` and fix any errors. Then report what changed and which claims need checking.

## Rules
- **Don't commit or push** unless the author asks. Pushing to `main` publishes the site.
- Never add PDFs of papers or long copied passages. Link the DOI or arXiv page instead.
- Never copy the author's private details into pages.
- Prefer one question per page, phrased as a question.
