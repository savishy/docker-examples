FROM ubuntu:14.04

# Install Ruby from Brightbox
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.2 ruby2.2-dev

# Dependencies for Android SDK
RUN apt-get install -y --no-install-recommends openjdk-7-jdk 
RUN apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0

# Download Android SDK
RUN apt-get install -y --no-install-recommends wget
RUN cd /opt && wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN cd /opt && tar xzf android-sdk_r24.4.1-linux.tgz
RUN cd /opt && rm -f android-sdk_r24.4.1-linux.tgz

# Other tools and resources of Android SDK
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo y | android update sdk --filter \
platform-tools,build-tools-19.0.3,android-17,extra-android-support --no-ui \
--force
# Git to pull external repositories of Android app projects
RUN apt-get install -y --no-install-recommends git

# Cleaning
RUN apt-get clean

# Calabash Android
RUN gem install calabash-android
