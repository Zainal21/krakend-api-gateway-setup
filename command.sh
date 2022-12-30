docker build -t turreta/krakend --file .\Dockerfile .

#run image 
docker run -p 8000:8000 turreta/krakend

# create volume
docker volume create krakend-api-gateway-config

# delte room volume
docker run --rm -it --name alpine --mount type=volume,source=krakend-api-gateway-config,target=/data alpine

# docker data bind
docker cp . alpine:/data

# run 
docker run -p 8000:8000 -v "krakend-api-gateway-config":/mykrakend devopsfaith/krakend run --config /mykrakend/config/krakend.json