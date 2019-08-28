# ArcGIS Portal on Docker

```sh
docker run --tty --interactive --hostname agportal.local \
  --name agportal \
  --volume $HOME/Documents/agp107.ecp:/arcgis/agp107.ecp \
  --env LICENSE_FILE=/arcgis/agp107.ecp \
  --publish 7080:7080 -p 7443:7443 \
  beginor/agportal:10.7.0
```
