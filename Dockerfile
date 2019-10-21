# Use their image that contains all the necessary libraries & headers
# to compile the srs application
FROM ossrs/dev 

# Create our app directory
RUN mkdir /app

WORKDIR /app

ADD trunk /app

# Compile the srs application that we forked
RUN ./configure && make

# Run SRS using the http flv streaming config
CMD ./objs/srs -c conf/http.flv.live.conf