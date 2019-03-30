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
COPY bin/rg /bin/rg

RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qa && \
        apk add neovim-doc && \
        npm install -g typescript

RUN cd /root/.config/nvim/plugged/nvim-typescript && \
  ./install.sh && \
  nvim --headless +UpdateRemotePlugins +qa

VOLUME /data
WORKDIR /data

CMD [ "nvim" ]
