FROM python:3.12-alpine

WORKDIR /opt/okta-awscli

COPY . .

RUN apk --update add gcc musl-dev libffi-dev openssl-dev \
    && pip install awscli uv \
    && uv sync --frozen --no-dev \
    && apk del --purge gcc musl-dev libffi-dev openssl-dev

ENTRYPOINT ["/opt/okta-awscli/.venv/bin/okta-awscli"]
