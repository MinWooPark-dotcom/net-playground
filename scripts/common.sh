DIG_TRACE() {
  local domain=$1
  dig +trace "$domain" @8.8.8.8
}