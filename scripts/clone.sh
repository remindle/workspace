#!/usr/bin/env bash
echo "Cloning repositories..."

script_folder="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
workspaces_folder="$(cd "${script_folder}/../.." && pwd)"

echo "Using ${script_folder} as script folder"
echo "Using ${workspaces_folder} as workspace folder"

clone-repo()
{
    echo "using ${workspaces_folder} to clone into"
    cd "${workspaces_folder}" || exit
    if [ ! -d "${1#*/}" ]; then
        git clone "https://github.com/$1"
        echo "Cloned $1"
    else
        echo "Already cloned $1"
    fi
}

input="${script_folder}/repos.list"
echo "Using input $input"
if [ -f "$input" ]; then
    while read -r repository;
    do
        echo "Cloning $repository"
        clone-repo "$repository"
    done < "$input"
else
    echo "No input file present"
fi