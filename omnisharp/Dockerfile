FROM mono

RUN apt-get update && apt-get install -y git nginx

# omnisharp-roslyn
RUN mkdir /tools
WORKDIR /tools
RUN git clone https://github.com/omnisharp/omnisharp-roslyn

COPY Startup.cs /tools/omnisharp-roslyn/src/OmniSharp.Http/Startup.cs

WORKDIR /tools/omnisharp-roslyn/src/OmniSharp.Http.Driver
RUN msbuild /v:q /t:restore,build /p:Configuration=Release

COPY SQLitePCLRaw.core.dll /tools/omnisharp-roslyn/bin/Release/OmniSharp.Http.Driver/net461

RUN mv /tools/omnisharp-roslyn/bin/Release/OmniSharp.Http.Driver/net461 /tmp/bin && \
      rm -rf /tools/omnisharp-roslyn && \
      mv /tmp/bin /tools/omnisharp-roslyn

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
VOLUME /data
WORKDIR /data

CMD service nginx start && mono /tools/omnisharp-roslyn/OmniSharp.exe -s /data -p 81
