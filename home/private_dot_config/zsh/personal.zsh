# Convert Anki audio in place.
function anki_ogg_to_mp3() {
  find "$HOME/Library/Application Support/Anki2/dan/collection.media" -type f -name "*.ogg" -exec sh -c 'for file do ffmpeg -y -i "$file" "${file%.ogg}.mp3"; done' sh {} +
  find "$HOME/Library/Application Support/Anki2/dan/collection.media" -type f -name "*.oga" -exec sh -c 'for file do ffmpeg -y -i "$file" "${file%.oga}.mp3"; done' sh {} +
}
