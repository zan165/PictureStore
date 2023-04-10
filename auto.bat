

set month=%date:~5,2%
set day=%date:~8,2%
set d=%month%.%day%

git pull

git add --all

git commit -m "auto push  %d%"

git push origin main