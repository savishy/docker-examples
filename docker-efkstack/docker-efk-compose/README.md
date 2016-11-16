# Docker and EFK Stack #

Run `docker-compose up`.

* Confirmed to work on Cygwin + Windows.

## Known Issues ##

### ElasticSearch 5.0 has issues

I am using elastic 2.4 as the 5.0 version complains.
https://github.com/docker-library/elasticsearch/issues/98

### Kibana 4.6 is compatible with Elastic 2.4

Therefore I am using Kibana 4.6.

### Docker Machine needs at least 2 GB memory

When starting the ElasticSearch container on Windows (Docker Machine) you might encounter
this issue:
http://stackoverflow.com/questions/34619215/docker-toolbox-cannot-allocate-memory

To fix this, delete your Docker Machine created by Docker Toolbox.
`docker-machine rm default`
Then start it with a higher amount of memory (e.g 2048 MB).
`docker-machine create -d virtualbox --virtualbox-memory 2048 default`
## References ##

1. http://www.techstricks.com/elasticsearch-fluentd-kibana-efk-setup-guide/
2. http://stackoverflow.com/questions/32834082/how-to-increase-docker-machine-memory-mac
