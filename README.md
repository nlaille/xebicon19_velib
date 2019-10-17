Build image

    docker build -t xebicon19_velib .
    
Run image

    docker run -v $(pwd)/notebooks:/home/jovyan/notebooks -p 8888:8888 xebicon19_velib
    # or
    ./start-docker.sh