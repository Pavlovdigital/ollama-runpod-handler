FROM ollama/ollama:0.6.6         # базовый образ

RUN ollama pull mistral-small3.1:24b   # качаем модель один раз

RUN pip install runpod requests        # библиотека для handler

COPY handler.py /handler.py
ENV RUNPOD_HANDLER=handler             # /run будет искать этот файл

ENV OLLAMA_HOST=0.0.0.0
EXPOSE 11434

CMD ["ollama", "serve"]
