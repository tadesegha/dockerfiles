FROM mono

RUN apt-get update
RUN apt-get install -y git
RUN mkdir /tools

WORKDIR /tools
RUN git clone https://github.com/omnisharp/omnisharp-roslyn

COPY Startup.cs /tools/omnisharp-roslyn/src/OmniSharp.Http/Startup.cs
WORKDIR /tools/omnisharp-roslyn/src/OmniSharp.Http.Driver
RUN msbuild /v:q /t:restore,build /p:Configuration=Release

COPY SQLitePCLRaw.core.dll /tools/omnisharp-roslyn/bin/Release/OmniSharp.Http.Driver/net461

EXPOSE 80
VOLUME /data
WORKDIR /data
CMD [ "mono", "/tools/omnisharp-roslyn/bin/Release/OmniSharp.Http.Driver/net461/OmniSharp.exe", "-s", "/data" ]
