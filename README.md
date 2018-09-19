# frontend-node-docker

🐋 Repository showcasing the flow developing Front-end projects using Node inside Docker.

Build using [`create-react-app`](https://github.com/facebook/create-react-app) for bootstraping. Source [article](https://www.peterbe.com/plog/how-to-create-react-app-with-docker).

## Advantages

- Simple development / build / production
- Not required to have `node`, `npm` or `yarn`
- Only requires Docker
- Easily extensible and customizable

## Content

- `Dockerfile`: define how to build image, ports to expose and so on.
- `docker-run.sh`: container task-wrapper, using one parameter. Handy for build, deploy, test... 

## Usage 

Steps to follow:

1. Customize `Dockerfile` as needed.
2. Customize `docker-run.sh` as needed.
3. Build the container `docker image build -t react:app .`
(Optional) `-t` allow to customize `REPOSITORY:TAG`.  
4. (Optional) check the build result with bash `docker container run -it react:app bash`
5. Run app: `docker container run -it -v $(pwd):/app react:app`
5. Build app: `docker container run -it -v $(pwd):/app react:app build`
6. Run tests: `docker container run -it -v $(pwd):/app react:app test`

*Note*: remove paused containers: `npm run docker:clean`
```
docker container prune
```

*Note*: You can name the containers with the `--name` flag, and the ssh into them:
```
docker container run -it -v $(pwd):/app --name containerToDebug react:app

docker exec -it containerToDebug bash
```

*Note*: files modified and created from the container may generate permission issues. Explanation and solution [here](https://denibertovic.com/posts/handling-permissions-with-docker-volumes/). Alternatively folder permission can be modified with:
```
sudo chmod -R 777 {directory}
```

### Live-Reload

In the case of `create-react-app`, it is possible to reload the web page each time source-files are changed.
Forward the web-socket port `35729`, as it triggers browser reload `document.location.reload()`.
```
ocker container run -it -p 3000:3000 -p 35729:35729 -v $(pwd):/app react:app
```
 
## License
MIT © [Alain Perkaz](https://aperkaz.github.io)