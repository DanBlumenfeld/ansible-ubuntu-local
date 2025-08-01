# ddrescue

If makeMKV fails to rip from a damaged disk, use ddrescue to create an .iso from it; then mount the .iso, and run MakeMkv against it.

First pass: recover as much as possible quickly, generate map file (dvd_backup.log) for later retry/resumption/improvement
`ddrescue -n /dev/sr0 dvd_backup.iso dvd_backup.log`
Second pass: retry failed sectors
`ddrescue -r3 /dev/sr0 dvd_backup.iso dvd_backup.log`

# yt-dlp

Pull down metadata, thumbnails, subtitles, etc. for all videos in a given Youtube playlist:

`yt-dlp   --ignore-errors   --continue   --format "bv*+ba/b"   --merge-output-format mkv   --write-subs   --write-auto-subs   --sub-lang "en.*"   --embed-subs   --embed-metadata   --write-description   --write-info-json   --write-annotations   --write-thumbnail   --embed-thumbnail   --output "~/Videos/PaintingBuddha/CommunityCollege/%(playlist_index)s - %(title).200s.%(ext)s"   "https://www.youtube.com/watch?v=3lBhsl3gwkc&list=PL0_grDypO1drKAXVfvppjauSiXCuLp2gU"
`
