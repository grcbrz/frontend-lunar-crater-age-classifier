# 🌙 Lunar Crater Age Classifier

- **Description:** A machine learning model deployed via a scalable web API to classify lunar crater image chipouts into age categories (Fresh Crater, Old Crater, No Crater).
- **Data used:** LROCNet Moon Classifier Dataset ([Zenodo/source](https://zenodo.org/records/7041842))
- **Which API we're using:** FastAPI (for the ML service)
- **Where front-end can be accessed:** ([Streamlit-Cloud] (https://lunaralge.streamlit.app/))

### What's here:

* [Streamlit](https://docs.streamlit.io/) on the frontend
* [FastAPI](https://fastapi.tiangolo.com/) on the backend
* [PIL/pillow](https://pillow.readthedocs.io/en/stable/) and [opencv-python](https://github.com/opencv/opencv-python) for working with images
* Backend and frontend can be deployed with Docker

### Architecture

The prediction flow is structured as a scalable, serverless pipeline on Google Cloud Platform (GCP).

```mermaid
graph TD
    A[Browser / Client] --> B[Streamlit Frontend];
    B --> C[FastAPI Backend: Cloud Run];
    C --> D[ML Model Inference: TensorFlow];
    D --> E[Prediction Result];
    E --> B;
```
---

## 🛠️ Setup and Local Usage

### Setup instructions

Document here for users who want to setup the package locally

1.  **Clone the Repository:**
    ```bash
    git clone YOUR_REPO_URL
    cd lunar-crater-age-classifier
    ```

2.  **Create and Activate Environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Configure Secrets:** Create the `.streamlit/secrets.toml` file with your Cloud Run backend URL:
    ```toml
    BACKEND_URL="[https://lunar-crater-737799387839.europe-west1.run.app](https://lunar-crater-737799387839.europe-west1.run.app)"
    ```

---

### 🔨 Makefile Commands

We use a `Makefile` to simplify common development tasks and ensure consistent execution across the team.

| Command | Description | Artifact/Service |
| :--- | :--- | :--- |
| `make install` | Installs all required Python dependencies. | Python Environment |
| `make build_api` | Builds the FastAPI service Docker image. | Docker Image |
| `make run_api_local` | Runs the FastAPI service locally on port 8000 (for testing). | FastAPI Container |
| `make streamlit` | Runs the Streamlit frontend locally. | Streamlit App |
| `make push_api` | Tags and pushes the Docker image to the Google Artifact Registry. | GCP Artifact Registry |
| `make deploy_api` | Deploys the latest image from the registry to Cloud Run. | Cloud Run Service |

**Example of use:**

```bash
# To install dependencies and run the frontend
make install
make streamlit
