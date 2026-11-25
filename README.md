# Curiosophy

An open learning notebook on AI, science, and whatever I get curious about next.
Live at **https://iammohithhh.github.io/Curiosophy**.

- Pages live in [`content/`](content/). Raw notes go in [`content/inbox/`](content/inbox/README.md), which stays local. Open `content/` as an Obsidian vault to write.
- AI assistants follow [`AGENTS.md`](AGENTS.md).
- Built with [Quartz](https://quartz.jzhao.xyz). Every push to `main` rebuilds and publishes the site through GitHub Actions.

## Preview locally
```
npm ci
npx quartz plugin install
npx quartz build --serve      # http://localhost:8080
```
