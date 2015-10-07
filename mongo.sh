DEFAULT_NAME="some-mongo"
DEFAULT_DATA_DIR="~/mongo-data"

function default() {
  if [[ -z "$1" ]]; then 
    echo "$2"
  else
    echo "$1"
  fi
}

function mongo-start() {
  name="$(default "$1" $DEFAULT_NAME)"
  data_dir="$(default "$2" $DEFAULT_DATA_DIR)"
  docker run --name $name -d -v $data_dir:/data/db -p 27017:27017 mongo
}

function mongo-shell() {
  name="$(default $1 $DEFAULT_NAME)"
  docker run -it --link $name:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
}
alias mongo-start="mongo-start"
