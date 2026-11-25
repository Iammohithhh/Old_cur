---
title: "Scientific Machine Learning: reading list"
---

_Curated 2026-11. ⭐ = essential (read first). Links: DOI for journal papers, arXiv abs page otherwise._

## 1. Orientation: reviews and the big picture
1. ⭐ [Physics-informed machine learning](https://doi.org/10.1038/s42254-021-00314-5) — Karniadakis et al., *Nature Reviews Physics* 2021. The field's map: the three ways to inject physics (observational, inductive, learning biases) and where PINNs and operators sit.
2. [Machine Learning for Fluid Mechanics](https://doi.org/10.1146/annurev-fluid-010719-060214) — Brunton, Noack & Koumoutsakos, *Annual Review of Fluid Mechanics* 2020. How ML maps onto flow modelling, control and optimisation, from someone who works on fluids.
3. [Promising directions of machine learning for partial differential equations](https://doi.org/10.1038/s43588-024-00643-2) — Brunton & Kutz, *Nature Computational Science* 2024. A short perspective on which ML-for-PDE directions show promise and which are oversold.
4. [Physics-based Deep Learning](https://arxiv.org/abs/2109.05237) — Thuerey et al., *arXiv* 2021 (living book). A hands-on text on supervised, physics-loss and differentiable-physics training, with notebooks.

## 2. Physics-informed neural networks: methods, pathologies, fixes
5. ⭐ [Physics-informed neural networks: A deep learning framework for solving forward and inverse problems involving nonlinear partial differential equations](https://doi.org/10.1016/j.jcp.2018.10.045) — Raissi, Perdikaris & Karniadakis, *Journal of Computational Physics* 2019. The paper that defined PINNs: PDE residual as a soft loss through automatic differentiation, applied to forward and inverse problems.
6. [The Deep Ritz Method: A Deep Learning-Based Numerical Algorithm for Solving Variational Problems](https://doi.org/10.1007/s40304-018-0127-z) — E & Yu, *Communications in Mathematics and Statistics* 2018. The variational (energy-minimising) alternative to strong-form residual losses.
7. [DeepXDE: A Deep Learning Library for Solving Differential Equations](https://doi.org/10.1137/19M1274067) — Lu et al., *SIAM Review* 2021. A PINN library and tutorial that also introduces residual-based adaptive refinement for choosing collocation points.
8. [Hidden fluid mechanics: Learning velocity and pressure fields from flow visualizations](https://doi.org/10.1126/science.aaw4741) — Raissi, Yazdani & Karniadakis, *Science* 2020. The flagship inverse-problem demo: recovering velocity and pressure fields from passive-scalar images.
9. [Understanding and Mitigating Gradient Flow Pathologies in Physics-Informed Neural Networks](https://doi.org/10.1137/20M1318043) — Wang, Teng & Perdikaris, *SIAM Journal on Scientific Computing* 2021. Shows that imbalanced loss-term gradients stall training, and introduces learning-rate annealing to reweight the terms.
10. ⭐ [When and why PINNs fail to train: A neural tangent kernel perspective](https://doi.org/10.1016/j.jcp.2021.110768) — Wang, Yu & Perdikaris, *Journal of Computational Physics* 2022. NTK analysis of spectral bias and loss imbalance in PINNs, leading to NTK-based adaptive weights.
11. ⭐ [Characterizing possible failure modes in physics-informed neural networks](https://arxiv.org/abs/2109.01050) — Krishnapriyan et al., *NeurIPS* 2021. Simple convection and reaction PDEs where PINNs fail because the loss landscape is ill-conditioned; fixes via curriculum and sequence-to-sequence training.
12. [Respecting causality for training physics-informed neural networks](https://doi.org/10.1016/j.cma.2024.116813) — Wang, Sankaran & Perdikaris, *Computer Methods in Applied Mechanics and Engineering* 2024. Causal time-weighting of residuals, which fixes chaotic and transient problems that standard PINNs cannot solve.
13. [PINNsFormer: A Transformer-Based Framework For Physics-Informed Neural Networks](https://arxiv.org/abs/2307.11833) — Zhao, Ding & Prakash, *ICLR* 2024. Adds temporal dependencies to PINNs through pseudo-sequences and attention.
14. [Gradient Alignment in Physics-informed Neural Networks: A Second-Order Optimization Perspective](https://arxiv.org/abs/2502.00604) — Wang et al., *NeurIPS* 2025. Treats conflicting loss gradients as the core obstacle and shows that quasi-second-order optimisers (SOAP) resolve it. Current state of the art for PINN accuracy.

## 3. Neural operators: learning solution maps between function spaces
15. ⭐ [Learning nonlinear operators via DeepONet based on the universal approximation theorem of operators](https://doi.org/10.1038/s42256-021-00302-5) — Lu et al., *Nature Machine Intelligence* 2021. The branch/trunk architecture for operator learning, grounded in Chen & Chen's universal approximation theorem.
16. ⭐ [Fourier Neural Operator for Parametric Partial Differential Equations](https://arxiv.org/abs/2010.08895) — Li et al., *ICLR* 2021. Global convolution in Fourier space that works across resolutions. The most-used neural PDE surrogate.
17. ⭐ [Neural Operator: Learning Maps Between Function Spaces](https://arxiv.org/abs/2108.08481) — Kovachki et al., *JMLR* 2023. The general framework: discretisation-invariant integral-kernel layers, universal approximation, and the GNO/LNO/FNO family.
18. [Physics-Informed Neural Operator for Learning Partial Differential Equations](https://doi.org/10.1145/3648506) — Li et al., *ACM/IMS Journal of Data Science* 2024. Combines data loss and PDE-residual loss for operators (PINO), with fine-tuning at test time.
19. [Fourier Neural Operator with Learned Deformations for PDEs on General Geometries](https://arxiv.org/abs/2207.05209) — Li et al., *JMLR* 2023. Geo-FNO: learns a deformation onto a latent uniform grid so FNO can handle irregular domains.
20. [U-NO: U-shaped Neural Operators](https://arxiv.org/abs/2204.11127) — Rahman, Ross & Azizzadenesheli, *TMLR* 2023. A multi-scale U-Net-style operator that allows deeper, more memory-efficient models.
21. [Convolutional Neural Operators for robust and accurate learning of PDEs](https://arxiv.org/abs/2302.01178) — Raonić et al., *NeurIPS* 2023. Alias-free convolutional operators (CNO) and a careful discussion of what "operator" should mean in practice.
22. [Spherical Fourier Neural Operators: Learning Stable Dynamics on the Sphere](https://arxiv.org/abs/2306.03838) — Bonev et al., *ICML* 2023. Spherical-harmonic FNO giving stable long rollouts on the sphere; the basis for later weather emulators.
23. [Transolver: A Fast Transformer Solver for PDEs on General Geometries](https://arxiv.org/abs/2402.02366) — Wu et al., *ICML* 2024. Physics-attention over learned "slices" of mesh points; a strong operator transformer for unstructured industrial meshes.
24. [Operator Learning: Algorithms and Analysis](https://arxiv.org/abs/2402.15715) — Kovachki, Lanthaler & Stuart, *Handbook of Numerical Analysis* 2024 (arXiv preprint linked). The rigorous reference on approximation theory, sample complexity and the curse of parametric complexity.

## 4. Learned simulators and ML-augmented numerical solvers
25. ⭐ [Learning to Simulate Complex Physics with Graph Networks](https://arxiv.org/abs/2002.09405) — Sanchez-Gonzalez et al., *ICML* 2020. The GNS encode-process-decode message-passing simulator for particles; also the training tricks (noise injection) behind stable rollouts.
26. [Learning Mesh-Based Simulation with Graph Networks](https://arxiv.org/abs/2010.03409) — Pfaff et al., *ICLR* 2021. MeshGraphNets: GNN simulators on adaptive meshes for CFD and cloth.
27. [Solver-in-the-Loop: Learning from Differentiable Physics to Interact with Iterative PDE-Solvers](https://arxiv.org/abs/2007.00016) — Um et al., *NeurIPS* 2020. Training corrections through a differentiable solver over unrolled steps beats training offline on precomputed data.
28. ⭐ [Machine learning–accelerated computational fluid dynamics](https://doi.org/10.1073/pnas.2101784118) — Kochkov et al., *PNAS* 2021. A learned interpolation inside a differentiable CFD solver gives 8–10× coarser grids (40–80× speedups) on 2D turbulence. The canonical hybrid ML-plus-solver paper.
29. [Message Passing Neural PDE Solvers](https://arxiv.org/abs/2202.03376) — Brandstetter, Worrall & Welling, *ICLR* 2022. A fully neural autoregressive solver, with the pushforward trick and temporal bundling for stability.
30. [PDE-Refiner: Achieving Accurate Long Rollouts with Neural PDE Solvers](https://arxiv.org/abs/2308.05732) — Lippe et al., *NeurIPS* 2023. Shows that neglected high-frequency modes cause rollout drift; fixes it with diffusion-style iterative refinement.
31. [AB-UPT: Scaling Neural CFD Surrogates for High-Fidelity Automotive Aerodynamics Simulations via Anchored-Branched Universal Physics Transformers](https://arxiv.org/abs/2502.09692) — Alkin et al., *TMLR* 2025. Industrial-scale surrogates on meshes up to 150M cells, run from CAD geometry alone.

## 5. Continuous-time, structure-preserving and differentiable models
32. ⭐ [Neural Ordinary Differential Equations](https://arxiv.org/abs/1806.07366) — Chen et al., *NeurIPS* 2018. Continuous-depth networks and adjoint backpropagation; the starting point for learned dynamics in continuous time.
33. [Universal Differential Equations for Scientific Machine Learning](https://arxiv.org/abs/2001.04385) — Rackauckas et al., *arXiv* 2020. Embeds neural networks inside known mechanistic ODEs/PDEs (UDEs). The hybrid-modelling philosophy of the Julia SciML ecosystem.
34. [Hamiltonian Neural Networks](https://arxiv.org/abs/1906.01563) — Greydanus, Dzamba & Yosinski, *NeurIPS* 2019. Learns a Hamiltonian so the learned dynamics conserve energy by construction.
35. [Lagrangian Neural Networks](https://arxiv.org/abs/2003.04630) — Cranmer et al., *ICLR Workshop (DeepDiffEq)* 2020. Learns a Lagrangian, so no canonical coordinates are needed.
36. [Incorporating Symmetry into Deep Dynamics Models for Improved Generalization](https://arxiv.org/abs/2002.03061) — Wang, Walters & Yu, *ICLR* 2021. Equivariant CNNs for fluid dynamics (translation, rotation, scale, Galilean) and their effect on generalisation.
37. [Lie Point Symmetry Data Augmentation for Neural PDE Solvers](https://arxiv.org/abs/2202.07643) — Brandstetter, Welling & Worrall, *ICML* 2022. Uses PDE symmetry groups to generate exact new training trajectories.
38. [JAX, M.D.: A Framework for Differentiable Physics](https://arxiv.org/abs/1912.04232) — Schoenholz & Cubuk, *NeurIPS* 2020. End-to-end differentiable particle simulation: a template for gradient-based physics design and learning.

## 6. Equation discovery, Koopman operators and reduced-order modelling
39. ⭐ [Discovering governing equations from data by sparse identification of nonlinear dynamical systems](https://doi.org/10.1073/pnas.1517384113) — Brunton, Proctor & Kutz, *PNAS* 2016. SINDy: sparse regression over a library of candidate terms gives interpretable governing equations.
40. [AI Feynman: A physics-inspired method for symbolic regression](https://doi.org/10.1126/sciadv.aay2631) — Udrescu & Tegmark, *Science Advances* 2020. Symbolic regression that uses dimensional analysis, symmetry and separability; rediscovers the Feynman Lectures equations.
41. [Interpretable Machine Learning for Science with PySR and SymbolicRegression.jl](https://arxiv.org/abs/2305.01582) — Cranmer, *arXiv* 2023. The standard open-source symbolic-regression engine, plus the EmpiricalBench benchmark.
42. [LLM-SR: Scientific Equation Discovery via Programming with Large Language Models](https://arxiv.org/abs/2404.18400) — Shojaee et al., *ICLR* 2025. LLM-guided program search for equations, combining scientific priors with evolutionary search.
43. [Dynamic mode decomposition of numerical and experimental data](https://doi.org/10.1017/S0022112010001217) — Schmid, *Journal of Fluid Mechanics* 2010. The original DMD paper: linear spectral decomposition straight from snapshots.
44. [Deep learning for universal linear embeddings of nonlinear dynamics](https://doi.org/10.1038/s41467-018-07210-0) — Lusch, Kutz & Brunton, *Nature Communications* 2018. Autoencoders that learn Koopman-invariant coordinates, including systems with continuous spectra.
45. [Modern Koopman Theory for Dynamical Systems](https://doi.org/10.1137/21M1401243) — Brunton et al., *SIAM Review* 2022. The comprehensive review of Koopman/DMD theory, algorithms and pitfalls.
46. [Data-driven operator inference for nonintrusive projection-based model reduction](https://doi.org/10.1016/j.cma.2016.03.025) — Peherstorfer & Willcox, *Computer Methods in Applied Mechanics and Engineering* 2016. Operator inference: fits reduced polynomial operators from data without access to the solver code.
47. [Model reduction of dynamical systems on nonlinear manifolds using deep convolutional autoencoders](https://doi.org/10.1016/j.jcp.2019.108973) — Lee & Carlberg, *Journal of Computational Physics* 2020. Nonlinear-manifold ROMs that beat linear POD on advection-dominated problems.

## 7. Turbulence, closure modelling and uncertainty quantification
48. [Reynolds averaged turbulence modelling using deep neural networks with embedded invariance](https://doi.org/10.1017/jfm.2016.615) — Ling, Kurzawski & Templeton, *Journal of Fluid Mechanics* 2016. The tensor-basis neural network: Galilean and rotational invariance built into RANS closures.
49. [Turbulence Modeling in the Age of Data](https://doi.org/10.1146/annurev-fluid-010518-040547) — Duraisamy, Iaccarino & Xiao, *Annual Review of Fluid Mechanics* 2019. The reference review of data-driven RANS and LES closure, including the a priori vs a posteriori consistency problem.
50. [Deep learning to represent subgrid processes in climate models](https://doi.org/10.1073/pnas.1810286115) — Rasp, Pritchard & Gentine, *PNAS* 2018. A neural convection parameterisation running inside a GCM, with an honest account of the instability problems.
51. [Automating turbulence modelling by multi-agent reinforcement learning](https://doi.org/10.1038/s42256-020-00272-0) — Novati, de Laroussilhe & Koumoutsakos, *Nature Machine Intelligence* 2021. Learns LES closures a posteriori with RL agents acting inside the solver.
52. [B-PINNs: Bayesian physics-informed neural networks for forward and inverse PDE problems with noisy data](https://doi.org/10.1016/j.jcp.2020.109913) — Yang, Meng & Karniadakis, *Journal of Computational Physics* 2021. Bayesian (HMC and variational) PINNs that give calibrated uncertainty from noisy data.
53. [Uncertainty quantification in scientific machine learning: Methods, metrics, and comparisons](https://doi.org/10.1016/j.jcp.2022.111902) — Psaros et al., *Journal of Computational Physics* 2023. A systematic survey and benchmark of UQ methods for PINNs and operators.

## 8. ML for weather and climate
54. [FourCastNet: A Global Data-driven High-resolution Weather Model using Adaptive Fourier Neural Operators](https://arxiv.org/abs/2202.11214) — Pathak et al., *arXiv* 2022. The first high-resolution (0.25°) global ML forecaster, built on AFNO.
55. [Accurate medium-range global weather forecasting with 3D neural networks](https://doi.org/10.1038/s41586-023-06185-3) — Bi et al., *Nature* 2023. Pangu-Weather: an Earth-specific 3D Swin transformer, the first ML model to beat ECMWF IFS deterministic skill.
56. ⭐ [Learning skillful medium-range global weather forecasting](https://doi.org/10.1126/science.adi2336) — Lam et al., *Science* 2023. GraphCast: a multimesh GNN that beats HRES on 90% of targets. The landmark that convinced operational centres.
57. [WeatherBench 2: A Benchmark for the Next Generation of Data-Driven Global Weather Models](https://doi.org/10.1029/2023MS004019) — Rasp et al., *Journal of Advances in Modeling Earth Systems* 2024. The standard evaluation protocol and leaderboard; essential for reading any weather-model claim.
58. ⭐ [Neural general circulation models for weather and climate](https://doi.org/10.1038/s41586-024-07744-y) — Kochkov et al., *Nature* 2024. NeuralGCM: a differentiable dynamical core plus learned physics, competitive for weather and stable for decadal climate runs. The hybrid paradigm at its strongest.
59. ⭐ [Probabilistic weather forecasting with machine learning](https://doi.org/10.1038/s41586-024-08252-9) — Price et al., *Nature* 2025. GenCast: a diffusion ensemble that outperforms ECMWF ENS. Generative models as probabilistic forecasters.
60. [AIFS – ECMWF's data-driven forecasting system](https://arxiv.org/abs/2406.01465) — Lang et al., *arXiv* 2024. How an operational centre built and deployed its own ML model (GNN encoder/decoder with a transformer processor).
61. [A foundation model for the Earth system](https://doi.org/10.1038/s41586-025-09005-y) — Bodnar et al., *Nature* 2025. Aurora: a 1.3B-parameter pretrained model fine-tuned for weather, air quality, ocean waves and cyclone tracks.
62. [End-to-end data-driven weather prediction](https://doi.org/10.1038/s41586-025-08897-0) — Allen et al., *Nature* 2025. Aardvark Weather replaces the whole NWP pipeline, including data assimilation, with ML that runs from raw observations to forecasts.
63. [Skillful joint probabilistic weather forecasting from marginals](https://arxiv.org/abs/2506.10772) — Alet et al., *arXiv* 2025. FGN, the model behind WeatherNext 2: trained on per-location CRPS, yet gives coherent joint ensembles that beat GenCast.

## 9. Benchmarks, critiques and PDE foundation models (frontier)
64. [PDEBench: An Extensive Benchmark for Scientific Machine Learning](https://arxiv.org/abs/2210.07182) — Takamoto et al., *NeurIPS Datasets & Benchmarks* 2022. The standard multi-PDE benchmark suite with FNO, U-Net and PINN baselines.
65. [Towards Multi-spatiotemporal-scale Generalized PDE Modeling](https://arxiv.org/abs/2209.15616) — Gupta & Brandstetter, *TMLR* 2023. PDEArena: a careful comparison of FNO and modern U-Nets showing that well-tuned U-Nets are hard to beat.
66. [The Well: a Large-Scale Collection of Diverse Physics Simulations for Machine Learning](https://arxiv.org/abs/2412.00568) — Ohana et al., *NeurIPS Datasets & Benchmarks* 2024. 15TB across 16 physics domains; the main pretraining and evaluation corpus for PDE foundation models.
67. ⭐ [Weak baselines and reporting biases lead to overoptimism in machine learning for fluid-related partial differential equations](https://doi.org/10.1038/s42256-024-00897-5) — McGreivy & Hakim, *Nature Machine Intelligence* 2024. A systematic review finding that most claimed speedups come from weak numerical baselines. Read it before you publish.
68. [Can physics-informed neural networks beat the finite element method?](https://doi.org/10.1093/imamat/hxae011) — Grossmann et al., *IMA Journal of Applied Mathematics* 2024. A sobering head-to-head comparison: for forward problems, FEM wins on both accuracy and cost.
69. [Towards Foundation Models for Scientific Machine Learning: Characterizing Scaling and Transfer Behavior](https://arxiv.org/abs/2306.00258) — Subramanian et al., *NeurIPS* 2023. The first systematic study of scaling and transfer for pretrained neural operators.
70. [Multiple Physics Pretraining for Physical Surrogate Models](https://arxiv.org/abs/2310.02994) — McCabe et al., *NeurIPS* 2024. MPP: one transformer pretrained across heterogeneous fluid systems, with a shared embedding space for physical fields.
71. [DPOT: Auto-Regressive Denoising Operator Transformer for Large-Scale PDE Pre-Training](https://arxiv.org/abs/2403.03542) — Hao et al., *ICML* 2024. Denoising autoregressive pretraining of a Fourier-attention operator on more than 100k trajectories across many PDEs.
72. [Poseidon: Efficient Foundation Models for PDEs](https://arxiv.org/abs/2405.19101) — Herde et al., *NeurIPS* 2024. A multiscale operator transformer pretrained on compressible and incompressible Euler/Navier–Stokes data that transfers sample-efficiently to unseen PDEs.
73. [Walrus: A Cross-Domain Foundation Model for Continuum Dynamics](https://arxiv.org/abs/2511.15684) — McCabe et al., *ICML* 2026. A 1.3B-parameter 2D/3D transformer trained on The Well and more (19 scenarios, 63 fields), with stabilisation and adaptive tokenisation. The current open PDE foundation-model baseline.

## Learning path
**Stage 1 — Foundations (orientation and canonical ideas):** 1 → 2 → 4 → 5 → 32 → 39 → 15 → 16 → 25 → 49 → 67 → 43.
Get the vocabulary, the three main paradigms (physics losses, operator learning, learned simulators) and the evaluation scepticism of 67 early, so you read everything after it critically.

**Stage 2 — Core methods (depth in each paradigm):**
- PINN training: 6 → 7 → 8 → 9 → 10 → 11 → 12.
- Operators: 17 → 18 → 19 → 22.
- Simulators and hybrid solvers: 26 → 27 → 28 → 29.
- Dynamics and symmetry: 33 → 34 → 35 → 36 → 37 → 38.
- Discovery and reduced models: 40 → 41 → 44 → 45 → 46 → 47.
- Closures and UQ: 48 → 50 → 52 → 53.
- Weather: 54 → 55 → 56.
- Benchmarks: 64 → 65 → 68.

**Stage 3 — Frontier (architectures, scale, 2024–26 landmarks):**
- Modern architectures: 20 → 21 → 23 → 24 → 30 → 31.
- PINN optimisation: 13 → 14.
- LLM-era discovery and RL closure: 42 → 51.
- Weather/climate frontier: 57 → 58 → 59 → 60 → 61 → 62 → 63.
- Foundation models: 3 → 66 → 69 → 70 → 71 → 72 → 73.
