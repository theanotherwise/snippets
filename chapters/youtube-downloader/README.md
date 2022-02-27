```bash
./yt-dlp --ignore-errors \
         --continue \
         --audio-format best \
         --format 137,136,135,134,133,160 \
         --output "./output/%(title)s.%(ext)s" \
         https://www.youtube.com/watch?v=XXX
```
