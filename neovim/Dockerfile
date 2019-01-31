FROM mhart/alpine-node

RUN apk add curl git python3 gcc musl-dev neovim py3-greenlet fzf the_silver_searcher py-pip py2-greenlet && \
      curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
          --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
      npm install -g neovim typescript && \
      pip install --upgrade pip && \
      pip install --upgrade pynvim && \
      pip3 install --upgrade pip && \
      pip3 install pynvim

COPY init.vim /root/.config/nvim/init.vim

RUN nvim -c ':UpdateRemotePlugins | :qa' && \
      nvim -c ':PlugInstall | :qa' && \
      mkdir /data

VOLUME /data
WORKDIR /data

CMD [ "nvim" ]
