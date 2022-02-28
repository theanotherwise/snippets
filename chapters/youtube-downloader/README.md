```bash
./yt-dlp --ignore-errors --continue \
         --format bestvideo[ext=webm]+bestaudio[ext=webm] \
         --output ".//output/%(title)s.%(ext)s" \
         https://www.youtube.com/watch?v=XXX
```
