# Metabase deployment on Google App Engine

[Metabase](https://www.metabase.com/) on [Google App Engine](https://cloud.google.com/appengine/) with PostgreSQL on [Cloud SQL](https://cloud.google.com/sql/) as a backend.

## Prerequisites

- GCP project with enabled billing
- Installed Google Cloud SDK with initialized `gcloud` tool
- Created App Engine application

Reference: https://cloud.google.com/appengine/docs/flexible/custom-runtimes/quickstart

## Deployment

```bash
gcloud app deploy
```
