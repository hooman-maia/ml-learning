# ML Learning

Personal ML learning curriculum — from neural network basics to MLOps and architecture blueprinting for medical imaging (spine segmentation).

## Structure

```
learning/
├── Dockerfile              # Jupyter environment (PyTorch + MONAI)
├── requirements.txt        # Pinned dependencies
├── docker-compose.yml      # One-command setup
└── notebooks/
    ├── phase0_concepts/    # Neural networks, training, CNNs (theory)
    ├── phase1_pytorch/     # Tensors, autograd, nn.Module, MNIST
    ├── phase2_segmentation/# U-Net, MONAI, training a segmentation model
    ├── phase3_transformers/# Attention, ViT, Swin Transformer, SwinUNETR
    ├── phase4_mlops/       # DVC, MLflow, model registry, Azure ML Studio
    └── phase5_integration/ # Codebase analysis, architecture blueprint, reflection
```

## Getting Started

```bash
cd learning
docker compose up
```

Open the Jupyter URL printed in the terminal. Notebooks are meant to be read and run in order (Phase 0 → 5).

## Requirements

- Docker
- No GPU needed — all notebooks run on CPU with small/synthetic datasets

## Context

Built to understand ML deeply enough to architect MLOps infrastructure (DVC, MLflow, Azure ML) for a medical AI startup doing spine/knee segmentation. Not meant to train production models — meant to understand how they work and how to manage them.
