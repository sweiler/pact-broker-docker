FROM openshift/ruby-22-centos7:latest


RUN bash -c "gem install bundler"

COPY pact_broker /app/pact_broker

WORKDIR /app/pact_broker
USER root
RUN chown -R default /app/pact_broker
USER default
RUN bash -c "bundle install"

CMD ["bash", "-c", "bundle exec unicorn -E production"]