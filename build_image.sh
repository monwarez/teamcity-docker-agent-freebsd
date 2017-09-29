sudo docker build  -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl -t lpp/teamcity_agent_bsd .
sudo docker run --privileged --net=host -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl --name=tcbsd -it lpp/teamcity_agent_bsd
sudo docker stop tcbsd
sudo docker commit tcbsd lpp/teamcity_agent_bsd
sudo docker rm tcbsd

