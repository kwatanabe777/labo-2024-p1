# regist func run container.
labo-php (){
  LABO_PWD=`pwd` docker compose run --rm php-cli php "$@"
}

echo "labo-php() defined."
echo "  Execute following when undefining:"
echo "  $ unset -f labo-php"
