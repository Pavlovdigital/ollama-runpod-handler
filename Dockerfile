FROM ollama/ollama:0.6.6

RUN ollama pull mistral-small3.1:24b
RUN pip install runpod requests

COPY handler.py /handler.py

ENV RUNPOD_HANDLER=handler

ENV OLLAMA_HOST=0.0.0.0
EXPOSE 11434

CMD ["ollama", "serve"]
