# The_Hundred_ML

# Environment


```bash

# jupyter/datascience-notebookイメージをダウンロード
docker pull jupyter/datascience-notebook

# Dockerfileの作成
cat > Dockerfile <<EOF
FROM jupyter/datascience-notebook

RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN jupyter serverextension enable --py jupyterlab
EOF

# jupyterlab:latestというイメージをビルド
docker build -t jupyterlab:latest ./
　
# パスワードの設定
docker run --rm -it \
  jupyter/datascience-notebook /bin/bash -c \
  "python -c 'from notebook.auth import passwd;print(passwd())'"

# Enter password:
# Verify password:
# sha1:xxxxx~~~xxxx

# --rm コンテナ終了時に削除
# p　my_port:container_port
# --name コンテナ名
# -v  ホストパス:コンテナパス
# jupyterlab:latestu  イメージ
# start.sh jupyter lab --NotebookApp.password="sha1:xxxxxxxxxxxxxxxxxxxxxxxx" コンテナに実行させるコマンド
docker run --rm -e TZ=Asia/Tokyo -p 8888:8888 --name jupyterlab -v `pwd`/work:/home/jovyan/work jupyterlab:latest start.sh jupyter lab --NotebookApp.password="xxxxxxxx"

# http://localhost:8888

# NotebookApp.passwordを忘れたとき
python -c 'from notebook.auth import passwd;print(passwd())'

```
