DEFAULT_NAME="bank-account-db"
DEFAULT_DATA_DIR="~/mongo-data"

function default() {
  if [[ -z "$1" ]]; then 
    echo "$2"
  else
    echo "$1"
  fi
}

function mongo-start() {
  docker-compose up -d
}

function mongo-shell() {
  name="$(default $1 $DEFAULT_NAME)"
  docker run -it --link $name:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
}
alias mongo-start="mongo-start"
alias mongo-shell="mongo-shell"
alias mongo-stop="docker-compose stop"
