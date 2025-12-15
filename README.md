# 🌙 Lunar Crater Age Classifier
- Document project frontend here
- Description
- Data used
- Which API you're using
- Where your front-end can be accessed
- ...
### What's here:

* [Streamlit](https://docs.streamlit.io/) on the frontend
* [FastAPI](https://fastapi.tiangolo.com/) on the backend
* [PIL/pillow](https://pillow.readthedocs.io/en/stable/) and [opencv-python](https://github.com/opencv/opencv-python) for working with images
* Backend and frontend can be deployed with Docker

### Using this package with Docker

### Setup instructions
Document here for users who want to setup the package locally

### Architecture

The prediction flow is structured as a scalable, serverless pipeline on Google Cloud Platform (GCP).

```mermaid
graph TD
    A[Browser / Client] --> B[Streamlit Frontend (Cloud Run)];
    B --> C[FastAPI Backend (Cloud Run)];
    C --> D[ML Model Inference];
