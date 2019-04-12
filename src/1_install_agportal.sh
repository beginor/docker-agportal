#!/bin/bash -e

curl --location --out /arcgis/Portal_for_ArcGIS_Linux_1061_164055.tar.gz \
  http://172.17.0.1/Portal_for_ArcGIS_Linux_1061_164055.tar.gz

tar -zxvf /arcgis/Portal_for_ArcGIS_Linux_1061_164055.tar.gz -C /arcgis/
rm /arcgis/Portal_for_ArcGIS_Linux_1061_164055.tar.gz

/arcgis/PortalForArcGIS/Setup -m silent -l yes -d /
rm -rf /arcgis/PortalForArcGIS
