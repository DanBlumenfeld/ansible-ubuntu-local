# ddrescue

If makeMKV fails to rip from a damaged disk, use ddrescue to create an .iso from it; then mount the .iso, and run MakeMkv against it.

First pass: recover as much as possible quickly, generate map file (dvd_backup.log) for later retry/resumption/improvement
`ddrescue -n /dev/sr0 dvd_backup.iso dvd_backup.log`
Second pass: retry failed sectors
`ddrescue -r3 /dev/sr0 dvd_backup.iso dvd_backup.log`


