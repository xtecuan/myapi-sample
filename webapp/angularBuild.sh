#!/bin/ash
node --max_old_space_size=102400    node_modules/@angular/cli/bin/ng build  --stats-json --source-map=false  --aot=true  --prod --progress
