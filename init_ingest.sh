docker-compose down
docker-compose up -d

URL_GREEN_TAXIS="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"
URL_ZONES="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv"


docker build -t green_taxi_ingest:v001 .

docker run -it \
--network pg-network \
green_taxi_ingest:v001 \
--user=postgres \
--password=postgres \
--host=10.5.0.6 \
--port=5432 \
--db=ny_taxi \
--table_name=green_taxis \
--url=${URL_GREEN_TAXIS} \


docker build -t zones_ingest:v001 .

docker run -it \
--network pg-network \
zones_ingest:v001 \
--user=postgres \
--password=postgres \
--host=10.5.0.6 \
--port=5432 \
--db=ny_taxi \
--table_name=zones \
--url=${URL_ZONES}