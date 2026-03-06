# ML Learning Environment
# Matches production stack: Python 3.11, PyTorch

FROM python:3.11-slim

WORKDIR /workspace

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Git config for DVC (needs git commits to work)
RUN git config --global user.email "learning@ml-studio" && \
    git config --global user.name "ML Studio" && \
    git config --global init.defaultBranch main

# Jupyter config - no token for local dev
RUN mkdir -p /root/.jupyter && \
    echo "c.ServerApp.token = ''" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.password = ''" >> /root/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_origin = '*'" >> /root/.jupyter/jupyter_server_config.py

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]