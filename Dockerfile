FROM python:3.12-slim AS build
WORKDIR /docs
COPY . .
RUN pip install mkdocs-material && mkdocs build

FROM nginx:alpine
COPY --from=build /docs/site /usr/share/nginx/html