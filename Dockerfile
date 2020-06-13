### Build and Test the App
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

### Optional: Set Proxy Variables
# ENV http_proxy {value}
# ENV https_proxy {value}
# ENV HTTP_PROXY {value}
# ENV HTTPS_PROXY {value}
# ENV no_proxy {value}
# ENV NO_PROXY {value}

### copy the source and tests
COPY src /src

WORKDIR /src/app

# build the app
RUN dotnet publish -c Release -o /app


###########################################################

### Build the runtime container
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine AS release

### Optional: Set Proxy Variables
# ENV http_proxy {value}
# ENV https_proxy {value}
# ENV HTTP_PROXY {value}
# ENV HTTPS_PROXY {value}
# ENV no_proxy {value}
# ENV NO_PROXY {value}

### if port is changed, also update value in Constants.cs
EXPOSE 5000
WORKDIR /app

### create a user
### dotnet needs a home directory
RUN addgroup -S quickstart && \
    adduser -S quickstart -G quickstart && \
    mkdir -p /home/quickstart && \
    chown -R quickstart:quickstart /home/quickstart

### run as quickstart user
USER quickstart

### copy the app
COPY --from=build /app .

ENTRYPOINT [ "dotnet",  "quickstart.dll" ]
