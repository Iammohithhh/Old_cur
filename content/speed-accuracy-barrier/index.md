---
title: "Documenting the Speed–Accuracy Barrier challenge"
date: 2026-11-27
status: ai-draft
code: none
sources:
  - "Discovered Materials, Grand Challenge 03: Breaking the Speed–Accuracy Barrier in Quantum Chemistry. https://discoveredmaterials.com/grand-challenges/speed-accuracy-barrier/"
  - "Goerigk et al., Phys. Chem. Chem. Phys. 19, 32184 (2017) (GMTKN55, WTMAD-2). https://doi.org/10.1039/C7CP04913G"
  - "Microsoft Research AI for Science, Accurate and scalable exchange-correlation with deep learning (Skala), arXiv 2025. https://arxiv.org/abs/2506.14665"
open-questions:
  - "Why has better exchange-correlation accuracy historically cost more compute?"
  - "Is the hidden ALD/CVD benchmark full of metals that GMTKN55 doesn't cover?"
  - "Why does the CPU cost gap between PBE and ωB97M-V nearly disappear on a GPU?"
---

My working notebook for the [Discovered Materials challenge](https://discoveredmaterials.com/grand-challenges/speed-accuracy-barrier/).
It's a record of how my understanding develops, not a finished article. Interesting findings get their own subpages, which are linked from here.
Papers I read along the way go in [[papers/index|Papers]].

## The challenge in one line

> *"Develop a more accurate exchange-correlation functional that improves DFT predictions without sacrificing computational efficiency."*

In other words: get **hybrid or coupled-cluster-level accuracy** at roughly the **cost of semilocal DFT**.
DFT is fast but often gets reaction chemistry wrong. Coupled cluster gets it right but is far too expensive to use at scale.
The challenge was written with input from Stefan Grimme (Bonn).

## What a submission needs
- **Method:** the approach and the science behind it.
- **Implementation:** working code that someone else can run and evaluate.
- **Results:** accuracy and cost on the public benchmark, GMTKN55.

## How it's judged
- **Accuracy:** WTMAD-2 (weighted total mean absolute deviation, in kcal/mol) on a **hidden** benchmark of reaction energies, activation barriers, binding energies and bond dissociation energies "representative of atomic layer deposition (ALD) and chemical vapor deposition (CVD) precursor chemistry".
  The reference values are CCSD(T) extrapolated to the complete basis set limit from triple- and quadruple-zeta calculations.
- **Speed:** time per molecule with the def2-QZVP basis, on one CPU core and separately on one A100 GPU. They report the median of three runs.
- **Reproducibility:** enough documentation for someone else to verify the results.

The challenge plot groups results into cost bands (**≤ 2× PBE**, 2–5× PBE, > 5× PBE) and accuracy bands (**< 1 kcal/mol**, which is chemical accuracy; 1–3; > 3).
The target is the empty corner: ≤ 2× PBE cost and close to 1 kcal/mol.

## The baseline (provisional leaderboard, Nov 2026)

| Functional | WTMAD-2 (kcal/mol) | CPU s/molecule | × PBE (CPU) | A100 s/molecule | × PBE (A100) |
|---|---|---|---|---|---|
| LDA | 26.35 | 2.4 | 0.8 | 1.33 | 0.9 |
| PBE | 12.47 | 3.0 | 1.0 | 1.47 | 1.0 |
| B3LYP | 16.16 | 4.0 | 1.3 | 1.50 | 1.0 |
| PBE0 | 8.37 | 3.9 | 1.3 | 1.41 | 1.0 |
| HSE06 | 8.29 | 12.2 | 4.1 | 1.94 | 1.3 |
| ωB97M-V | **3.81** | 43.5 | **14.5** | 3.94 | **2.7** |

The "× PBE" columns are my own ratios from the listed times.
r²SCAN and Skala are "being evaluated" and don't have numbers yet.
Skala's paper reports 2.8 kcal/mol on GMTKN55 at roughly semilocal cost, but that may not use the same setup as the challenge, so I'm not comparing it directly yet.

## First observations

1. **PBE0 is cheap here.** It's only about 1.3× PBE on the CPU and roughly the same on the GPU, yet it cuts the error from 12.5 to 8.4.
   So for these small molecules, exact exchange doesn't seem to be the expensive part. The jump in cost happens at ωB97M-V, which adds range separation, a meta-GGA and VV10 nonlocal correlation.
   *Question:* which of those is actually the cost? And how does this change for bigger molecules, where exact exchange scales worse?
2. **On a GPU, the speed gap mostly disappears.** ωB97M-V is 14.5× PBE on one CPU core but only 2.7× on an A100.
   So whether something counts as "fast enough" depends on the hardware.
3. **The test set isn't the hidden set.** GMTKN55 is main-group chemistry. ALD/CVD precursors usually contain metals (Al, Ti, Hf, Zr, …).
   *My guess:* a functional tuned on GMTKN55 might not carry over to the hidden benchmark, and that could be where the real difficulty lies.
4. **B3LYP is worse than PBE (16.2 vs 12.5).** My guess is it was run without a dispersion correction. Worth checking, because it says something about what WTMAD-2 rewards.

## Open questions
- Why has better XC accuracy historically cost more compute? (Jacob's ladder, exact exchange, nonlocal correlation.)
- What exactly does WTMAD-2 weight, and which GMTKN55 subsets dominate it?
- What's in typical ALD/CVD precursor chemistry, and how well do current functionals handle it?
- How does Skala get hybrid-level accuracy at semilocal cost, and what does it need for training data?

## Subpages
None yet. They'll be linked here as I write them.

## Journal
- **2026-11-27:** Read the challenge page and the leaderboard. Wrote down the four observations above. Next: why accuracy costs compute.

> [!todo] Things to check
> - Leaderboard numbers are copied from the challenge page as of Nov 2026 and are marked "provisional". Recheck before relying on them.
> - The prize amount, deadline and training-data rules aren't on the challenge page. A figure of $200,000 came from an AI chat and is unverified.
> - Whether the hidden benchmark really contains transition metals is my inference from "ALD/CVD precursor chemistry", not something the page says.
> - Whether B3LYP was run without a dispersion correction.
> - Skala's 2.8 kcal/mol on GMTKN55 is from a search summary of the paper. Check it in the paper itself, along with the benchmark setup.

## Related
- [[papers/index|Papers: my understanding]]
