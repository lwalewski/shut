#!/bin/bash
#
# query user for version string of the form MAJOR.MINOR.PATCH, validate it and
# send to stdout, if optional current version is provided, offer default value
# by incrementing its PATCH

regex="^[0-9]+\.[0-9]+\.[0-9]+$" # matches three integers separated by two dots

usage="$0 -c <current_version>"
while getopts ":c:h" opt; do
  case $opt in
    c)
      current_ver=$OPTARG
      ;;
    h)
      echo "$usage" >&2
      exit 0
      ;;
    :)
      echo "*** option -$OPTARG requires an argument" >&2
      exit 1
      ;;
    \?)
      echo "*** invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [ -z "$current_ver" ]; then
  : # no-op, i.e. it's OK for $current_ver to be empty
elif [[ "$current_ver" =~ $regex ]]; then
  echo "current version $current_ver" >&2
  # construct default by incrementing current version's PATCH number
  last_patch=$(echo $current_ver | cut -d'.' -f3)
  ((offer_patch=last_patch+1))
  default_ver="$(echo $current_ver | cut -d'.' -f1-2).$offer_patch"
else
  echo "+++ discarding invalid version string '$current_ver'" >&2
fi

echo -n "please enter new version string " >&2
if [ -n "$default_ver" ]; then
  echo -n "[$default_ver] " >&2
fi
echo -n ": " >&2
read user_input

if [ -z "$user_input" ]; then
  trial="$default_ver"
else
  trial="$user_input"
fi

if [[ "$trial" =~ $regex ]]; then
  new_ver="$trial"
else
  echo "*** input '$trial' is not a valid version string (MAJOR.MINOR.PATCH expected)" >&2
  exit 1
fi

echo "got new version $new_ver" >&2
echo $new_ver
