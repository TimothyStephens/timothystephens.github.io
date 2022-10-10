#!/usr/bin/env bash

echo -e "\n#### Loading conda env"
CONDA_PATH=$(which conda)
source ${CONDA_PATH%conda}/../etc/profile.d/conda.sh
conda activate render_cv

echo -e "\n#### Running render scripts"
(
cd scripts/
Rscript print_code_md.r
Rscript print_media_md.r
Rscript print_publication_md.r
Rscript print_talks_md.r
Rscript print_teaching_md.r
Rscript render_cv.r
)

echo -e "\n#### Pushing changes to github"
git add --all && git commit -m "Update pages on $(date)" && git push

