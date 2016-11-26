FROM peterchapmanuk/ultraesb:latest
# create log dir and change permissions
# note: only 777 makes ultraesb work
# http://stackoverflow.com/a/23161071/682912
USER root
RUN mkdir -p /var/ultraesb/logs
RUN chown -R ultraesb /var/ultraesb
RUN chmod -R 777 /var/ultraesb/
