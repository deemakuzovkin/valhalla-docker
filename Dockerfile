FROM golang:alpine as build
RUN apk --no-cache add tzdata

FROM ghcr.io/gis-ops/docker-valhalla/valhalla
ARG OSM_FILE=kaliningrad-latest.osm.pbf
COPY --from=build /usr/share/zoneinfo /usr/share/zoneinfo
ADD custom_files/$OSM_FILE /custom_files/$OSM_FILE
ENV build_tar=false
EXPOSE 8002
