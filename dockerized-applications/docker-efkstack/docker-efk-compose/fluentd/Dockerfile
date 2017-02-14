FROM fluent/fluentd:v0.12-latest
ADD fluent.conf /fluent/etc/fluent_efk.conf
RUN gem install --no-ri --no-rdoc fluent-plugin-elasticsearch
ENTRYPOINT fluentd -c /fluent/etc/fluent_efk.conf
