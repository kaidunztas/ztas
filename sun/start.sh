export container=ztas-sun
export image=ztas-sun:linux
export toport=7500
# docker run -itd -p $toport:7500 --name $container $image
docker start $container
sleep 5
export uri=`docker exec $container cat ztas_sunp2p.yaml | grep uri`
echo "$uri"