# jupyter_env
Env based off /jupyter/docker-stacks with personal requirements baked into image for offline use.

# Ref

Dockerfile made to add requirements following recipe from:
https://github.com/jupyter/docker-stacks/blob/master/docs/using/recipes.md

Also adds code formatter extension & black.

# Build
```
docker build . -t scipy-nb-custom
```

# Run
Run command:
```
docker container run --rm \
-p 10000:8888 \
-e JUPYTER_ENABLE_LAB=yes \
-v "${PWD}":/home/jovyan/work \
scipy-nb-custom \
start.sh jupyter lab --ServerApp.token=''
```

Notes:
* setting the token to blank means jupyter server open to whole network - not a good idea unless running somewhere airgapped.
* `joyvan` is the user the stack is built with, dont know why
* the volume mount will make the directory the command is run from available within `/work` in the container.
