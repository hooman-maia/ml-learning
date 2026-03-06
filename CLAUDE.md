# ML Studio - Learning Project

## Context & Objectives

**Who:** Hooman - polyvalent engineer (infra, web dev, devops, python) at a medical AI startup

**Company situation:**
- Startup working on **spine segmentation** and **knee segmentation** (medical imaging)
- ML team exists but is "lazy" on git usage and dataset management
- Data currently on NAS, needs to move to cloud storage
- Have Azure credits as startup
- FDA 510(k) submissions require full data lineage and traceability (serious, but not immediate pressure)

**The problem:**
- Too many Excel files, no proper versioning
- No experiment tracking
- No model registry
- Can't trace which data trained which model
- This is a liability for regulatory compliance

**The opportunity:**
- Hooman wants to learn ML fundamentals (not just MLOps)
- Build a learning playground that mimics the real spine/knee pipeline
- Understand deeply, then help architect the real solution
- Compare open source (DVC, MLflow) vs managed (Azure ML Studio)

---

## What Exists

### Production Code: `/segmentation/`
The dockerized inference system for spine segmentation (VeriFine v0.16.0):

- **Architecture:** SwinUNETR (Swin Transformer + U-Net)
- **Framework:** PyTorch 2.6 + MONAI 1.4
- **Two-stage pipeline:**
  1. Region model (2mm) → identifies spine regions (cervical, thoracic, lumbar, sacrum)
  2. Instance model (1mm) → identifies individual vertebrae
- **Well done:** Docker, GitLab CI/CD, security scanning, documentation
- **Missing:** No DVC, no MLflow, no experiment tracking, no data lineage

---

## Learning Plan

### Phase 0: Concepts (no code, just understanding)
- [ ] What is a neural network
- [ ] What is training vs inference
- [ ] What is a loss function
- [ ] Why GPUs matter
- [ ] Backpropagation (high level)

### Phase 1: Hands-on basics
- [ ] PyTorch fundamentals (tensors, autograd, nn.Module)
- [ ] Simple image classification (MNIST)
- [ ] What is a CNN - build one from scratch
- [ ] Training loop mechanics

### Phase 2: Segmentation
- [ ] What segmentation is (per-pixel classification)
- [ ] U-Net architecture - understand it deeply
- [ ] Train a simple U-Net on toy data
- [ ] MONAI basics (the framework the team uses)

### Phase 3: Modern architectures
- [ ] What are Transformers (attention mechanism)
- [ ] Vision Transformers (ViT)
- [ ] SwinUNETR - understand what the production code uses

### Phase 4: MLOps
- [x] DVC for data versioning
- [x] MLflow for experiment tracking
- [x] Model registry concepts
- [x] DVC pipelines (reproducible workflows)
- [x] DVC + MLflow integration (full traceability)
- [x] Azure ML Studio comparison

### Phase 5: Integration & Architecture Blueprint
- [x] Codebase analysis (training + inference software items, duplication map, gap analysis)
- [x] Target architecture blueprint (repo strategy, CI/CD, Azure resources, FDA lineage)
- [x] Reflection & beyond (Q&A, pitfalls, FDA considerations, action plan)

---

## Project Structure (Planned)

```
ml-studio/
├── CLAUDE.md                 ← this file
├── segmentation/             ← production inference code (reference)
└── learning/
    ├── phase0_concepts/      ← theory notebooks/notes
    ├── phase1_pytorch/       ← PyTorch basics, CNN, MNIST
    ├── phase2_segmentation/  ← U-Net, MONAI
    ├── phase3_transformers/  ← ViT, SwinUNETR
    ├── phase4_mlops/         ← DVC, MLflow, Azure ML
    └── phase5_pipeline/      ← full mini-pipeline
```

---

## Tech Stack & Guidelines

### Libraries (decided)

| Category | Library | Version | Reason |
|----------|---------|---------|--------|
| ML framework | PyTorch | 2.6.0 | Matches production |
| Vision | torchvision | 0.21.0 | Matches PyTorch |
| Visualization | matplotlib | >=3.8 | Standard, simple, everyone uses it |
| Data | numpy | >=1.26 | Matches production |
| Data | pandas | >=2.1 | Matches production |
| Jupyter | jupyterlab | >=4.0 | Modern, stable |
| Medical imaging | MONAI | 1.4.0 | Add in Phase 2, matches production |
| Image processing | scikit-image | >=0.22 | Segmentation utilities |
| Utilities | tqdm, pyyaml | latest | Basics |

**NOT using (keep minimal):**
- plotly (not needed for learning)
- seaborn (matplotlib is enough)
- ipywidgets (add only if needed)

### Guidelines

1. **Use up-to-date documentation** - Don't rely on old patterns (e.g., `NotebookApp` is deprecated, use `ServerApp`)
2. **Keep dependencies minimal** - Add libraries only when actually needed
3. **Match production where possible** - Use same versions as `/segmentation/` code
4. **Jupyter in Docker** - Keep Mac clean, reproducible environment

---

## Key Terminology to Learn

| Term | Meaning |
|------|---------|
| CNN | Convolutional Neural Network - how computers "see" images |
| U-Net | Architecture for segmentation (encoder-decoder with skip connections) |
| Transformer | Architecture using "attention" mechanism, originally for text, now for images too |
| SwinUNETR | Swin Transformer + U-Net hybrid (what production code uses) |
| PyTorch | Python ML framework (what the team uses) |
| libtorch | C++ version of PyTorch (for production speed) |
| MONAI | Medical Open Network for AI - PyTorch library for medical imaging |
| DVC | Data Version Control - git for data |
| MLflow | Experiment tracking and model registry |
| Inference | Using a trained model to make predictions |
| Training | Teaching a model by showing it examples |
| Loss function | Measures how wrong the model is (training tries to minimize this) |
| Backpropagation | How the model learns from mistakes (calculates gradients) |

---

## Current Status

**Date:** 2026-01-27

- [x] Initial discussion and context gathering
- [x] Explored production segmentation code
- [x] Created learning plan
- [x] Set up learning project structure (Docker + Jupyter)
- [x] Fixed Dockerfile (use `ServerApp` not deprecated `NotebookApp`)
- [x] Cleaned requirements.txt (removed plotly, seaborn, ipywidgets)
- [x] Created Phase 0 notebooks (COMPLETE):
  - [x] 01_what_is_a_neural_network.ipynb
  - [x] 02_training_and_loss.ipynb
  - [x] 03_gpus_and_parallelism.ipynb
  - [x] 04_intro_to_cnns.ipynb
- [x] Created Phase 1 notebooks (COMPLETE):
  - [x] 01_pytorch_tensors.ipynb
  - [x] 02_autograd.ipynb
  - [x] 03_nn_module.ipynb
  - [x] 04_training_loop.ipynb
  - [x] 05_mnist_classifier.ipynb
- [x] Created Phase 2 notebooks (COMPLETE):
  - [x] 01_segmentation_basics.ipynb
  - [x] 02_unet_architecture.ipynb
  - [x] 03_train_unet.ipynb
  - [x] 04_monai_intro.ipynb
- [x] Created Phase 3 notebooks (COMPLETE):
  - [x] 01_attention_mechanism.ipynb
  - [x] 02_vision_transformer.ipynb
  - [x] 03_swin_transformer.ipynb
  - [x] 04_swinunetr_explained.ipynb
- [x] Created Phase 4 notebooks (COMPLETE):
  - [x] 01_dvc_data_versioning.ipynb
  - [x] 02_experiment_tracking_mlflow.ipynb
  - [x] 03_model_registry.ipynb
  - [x] 04_dvc_pipelines.ipynb
  - [x] 05_putting_it_together.ipynb
  - [x] 06_azure_ml_studio.ipynb
- [x] Created Phase 5 notebooks (COMPLETE):
  - [x] 01_codebase_analysis.ipynb
  - [x] 02_target_architecture.ipynb
  - [x] 03_reflection_and_beyond.ipynb
  - [x] 04_annexe_good_to_know.ipynb
- [x] LEARNING PLAN COMPLETE

---

## Notes

- Hooman prefers open source but pragmatic about using Azure credits
- Learning by doing > pure theory
- Goal is to understand enough to architect, not to become ML researcher
- FDA compliance is background requirement (data lineage matters)

### Environment

- **No GPU required** - All notebooks work on CPU. Training on small datasets takes seconds/minutes.
- **No real data needed** - Using synthetic and downloadable datasets:
  - Phase 0-1: MNIST (auto-downloads via torchvision)
  - Phase 2: Synthetic shapes + Oxford Pets (auto-downloads)
  - Phase 2 MONAI: Synthetic 3D volumes or MONAI demo data
- **Rebuild Docker when adding libs** - Uncomment MONAI in requirements.txt for Phase 2
