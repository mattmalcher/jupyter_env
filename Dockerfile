# Start from a core stack version
FROM jupyter/scipy-notebook:lab-3.1.17
# Install from requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

# copy modified settings for jupyterlab_code_formatter 
# uses black by default.
COPY settings /home/jovyan/.jupyter/lab/user-settings/@ryantam626

RUN mamba install --yes --file /tmp/requirements.txt && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"