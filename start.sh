!/bin/bash
pm2 start /pagermon/server/process.json
bash /pagermon/client/reader.sh
