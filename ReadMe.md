# npm への公開テスト用リポジトリ

## モジュールインストール & ビルド

```sh
$ npm install
$ npm run build
```

## テスト

```sh
$ npm link
$ hello-world
Hello World!
$ npm unlink -g @tettekete/hello-world
$ hello-world                         
zsh: command not found: hello-world
```

## ビルド & テスト with Docker

```sh
$ docker compose up --build
...
...
> hello-world
app-1  | Hello World!
```


