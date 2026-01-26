FROM python:3.13.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

WORKDIR /code
ENV PATH="/code/.venv/bin:$PATH"

COPY pyproject.toml .python-version uv.lock ./
RUN uv sync --locked

COPY python_2025_data.py python_zones_csv.py ./

ENTRYPOINT ["uv", "run", "python", "python_2025_data.py"]