FROM python:2.7-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev make
RUN mkdir -p /src
WORKDIR /src/

COPY e3db/ /src/e3db/
COPY ["README.md", "LICENSE.md", "setup.py", "/src/"]

RUN python setup.py bdist_wheel && \
  pip install --use-wheel --find-links=./dist/ e3db

COPY integration.py /src/integration.py

ENTRYPOINT ["/src/integration.py"]
