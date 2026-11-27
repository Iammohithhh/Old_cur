# Curiosophy

An open learning notebook on AI, science, and whatever I get curious about next.
Live at **https://iammohithhh.github.io/Curiosophy**.

- Pages live in [`content/`](content/). Raw notes go in [`content/inbox/`](content/inbox/README.md), which stays local. Open `content/` as an Obsidian vault to write.
- AI assistants follow [`AGENTS.md`](AGENTS.md).
- The site is built with [Quartz](https://quartz.jzhao.xyz), which isn't stored here: [`site/build.sh`](site/build.sh) downloads it at build time. Site settings are in [`site/quartz.config.yaml`](site/quartz.config.yaml). Every push to `main` rebuilds and publishes the site.

## Preview locally
```
site/build.sh --serve      # http://localhost:8080
```
