#/usr/bin/env bash
# - Laravel Version: 8.64.0
# - Nova Version: #.#.#
# - PHP Version: #.#.#
# - Database Driver & Version:
# - Operating System and Version: #.#
# - Browser type and version: #.#
# - Reproduction Repository: https://github.com/###/###

declare -A defaults=( [Hostname]="127.0.0.1" )
declare -A vinfo=(
    ["Laravel Version"]="grep 'const VERSION' vendor/laravel/framework/src/Illuminate/Foundation/Application.php | sed 's/.* //'"
    ["Nova Version"]="grep version vendor/laravel/nova/composer.json | sed 's/.* //'"
    ["PHP Version"]="curl -s localhost | egrep -o '\(PHP v[^)]+\)'"
    ["Database Driver & Version"]="mysqladmin --version"
    ["Operating System and Version"]="lsb_release -d -s"
    ["Browser type and version"]="browser_check"
    ["Reproduction Repository"]="echo n/a"
)


browser_check() 
{
    echo -e "\n*****\n** Please open this link in your browser a few times: http://${defaults[Hostname]}:8123/\n*****\n\n" >&2
    agent=$( socat tcp4-listen:8123,reuseaddr stdout | grep User-Agent | head -n1 )
    echo "$agent"
}

which socat || {
  which apt-get && {
    apt-get install -y socat
  }
}

for KEY in "${!defaults[@]}"; do
  VALUE=${defaults[$KEY]}
  read -p "$KEY: " -i "$VALUE" -e NEW_VALUE
  defaults[$KEY]=$NEW_VALUE
done

for KEY in "${!vinfo[@]}"; do
  VALUE=${vinfo[$KEY]}
  echo "Getting $KEY via \"$VALUE\" >" >&2
  RESULT=$( eval "$VALUE" )
  vinfo[$KEY]=$RESULT
done

echo -e "\n\n\n* Laravel Version Information obtained by https://github.com/sfinktah/laravel-version-info *"

for KEY in "${!vinfo[@]}"; do
  VALUE=${vinfo[$KEY]}
  echo "$KEY: $VALUE"
done

