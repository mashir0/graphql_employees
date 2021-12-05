FROM python:3.8-alpine

RUN apk update      && \
    apk --no-cache add \
        curl    \
        fish    \
        git     \
        sudo    \
        vim     \
        yarn    \
        wget

RUN pip install --upgrade pip              && \
    pip install Django==3.1.2              && \
    pip install django-cors-headers==3.5.0 && \
    pip install graphene-django==2.13.0    && \
    pip install PyJWT==1.7.1               && \
    pip install django-filter==2.4.0       && \
    pip install django-graphql-jwt==0.3.1

RUN yarn global add create-react-app        

RUN curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
#   fisher install oh-my-fish/theme-bobthefish

WORKDIR /work/server
CMD ["/usr/bin/fish"]
