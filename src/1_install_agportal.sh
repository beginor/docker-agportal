#!/bin/bash -e

curl --location --out /arcgis/Portal_for_ArcGIS_Linux_107_167718.tar.gz \
  http://172.21.68.69/Downloads/Portal_for_ArcGIS_Linux_107_167718.tar.gz

tar -zxvf /arcgis/Portal_for_ArcGIS_Linux_107_167718.tar.gz -C /arcgis/
rm /arcgis/Portal_for_ArcGIS_Linux_107_167718.tar.gz

/arcgis/PortalForArcGIS/Setup -m silent -l yes -d /
rm -rf /arcgis/PortalForArcGIS
