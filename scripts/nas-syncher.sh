#!/usr/bin/env bash
set -e

src="/Volumes/personal_folder"
dst_dir="$HOME/_cloud/"
dests_path="${1:-$HOME/.config/nas-syncer/dests.txt}"

if [[ ! -f "${dests_path}" ]]; then
  echo "\"$dests_path\" file must be present" 1>&2
  exit 1
fi

while IFS= read -r src_obj; do
  rsync -avh --delete \
    "${src}/${src_obj}" \
    "${dst_dir}"
done < $dests_path



