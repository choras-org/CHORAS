# Compiling the JOSS paper
To complile the PDF, make sure Docker is running on your machine, navigate to this folder using a command window / terminal and run the following command:

```shell
docker run --rm -it \           
    -v $PWD:/data \
    -u $(id -u):$(id -g) \
    openjournals/inara \
    -o pdf,crossref \
    ./paper.md
```

Otherwise, there is a GitHub Action that will be triggered when pushing to the `JOSS` branch.