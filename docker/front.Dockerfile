FROM node:16.13.1-alpine

RUN apk update      && \
#   apk --no-cache add \
#       curl    \
#       fish    \
#       git     \
#       sudo    \
#       vim     \
#       yarn    \
#       wget && \ 
    npm install -g npm

#RUN curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
#RUN yarn add react-router-dom@5.3.0 \
#             @material-ui/core      \ 
#             @material-ui/icons     \
#             react-router-dom       \
#             @apollo/react-hooks    \
#             graphql                \
#             jwt-decode

WORKDIR /work/front
COPY    . . 

RUN yarn 

EXPOSE 3000
CMD ["/bin/ash"]
