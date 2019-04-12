# ArcGIS Portal on Docker

```sh
docker run --tty --interactive --hostname agportal.local \
  --name agportal \
  --volume $HOME/Documents/agp106.ecp:/arcgis/agp106.ecp \
  --env LICENSE_FILE=/arcgis/agp106.ecp \
  --publish 7080:7080 -p 7443:7443 \
  beginor/agportal:10.6.1
```
