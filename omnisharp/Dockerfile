FROM mono

RUN apt-get update
RUN apt-get install -y git
RUN mkdir /tools

WORKDIR /tools
RUN git clone https://github.com/omnisharp/omnisharp-roslyn

WORKDIR /tools/omnisharp-roslyn/src/OmniSharp.Http.Driver
RUN msbuild /v:q /t:restore,build /p:configuration=release

COPY SQLitePCLRaw.core.dll /tools/omnisharp-roslyn/bin/release/OmniSharp.Http.Driver/net461

VOLUME /data
CMD [ "mono", "/tools/omnisharp-roslyn/bin/release/OmniSharp.Http.Driver/net461/OmniSharp.exe", "-s", "/data" ]
