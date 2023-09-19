ARG MKDOCS_MATERIAL_VERSION=9.3.1
ARG PLANTUML_VERSION=1.2023.11

FROM squidfunk/mkdocs-material:$MKDOCS_MATERIAL_VERSION
RUN apk add --no-cache plantuml ttf-dejavu graphviz
RUN sed 's/\(\.jar'\''\)\s\(\"\)/\1 -Djava.awt.headless=true -failfast2 \2/' /usr/bin/plantuml
RUN pip install --no-cache-dir mkdocs-build-plantuml-plugin plantuml-markdown

CMD [ "mkdocs", "build" ]
