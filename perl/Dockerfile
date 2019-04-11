FROM perl:latest

RUN curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious JSON TAGOMORIS/Woothee-v1.10.0.tar.gz

ENV MOJO_LISTEN http://*:8080
EXPOSE 8080

# add your application code and set the working directory
ADD . /app
WORKDIR /app

RUN chmod +x main.pl
CMD ["./main.pl", "daemon"]
