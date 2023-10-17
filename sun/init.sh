export container=ztas-sun
export image=ztas-sun:linux
export port=7500
docker build -t $image .  --build-arg sun_port=$port
docker create --name $container -p $port:$port/udp $image ./ztas_sunp2p service run
