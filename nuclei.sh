nuclei() {
	local TPL="$HOME/Documents/nuclei-templates"

	[[ -z "${1}" ]] && { echo "-target/-l ?"; return; }
	[[ -z "${2}" ]] && { echo "Input target?"; return; }

	local T=""

	for i in `ls -1d ${TPL}/*/`; do
		if [[ ! "${i}" =~ (brute-force|examples|payloads) ]]; then
			T+="-t ${i} "
		fi
	done

	eval "nuclei -c 200 ${1} ${2} ${T} \
		-exclude ${TPL}/technologies/tech-detect.yaml \
		-o \"$(basename $2)_nuclei-results.txt\""
}

nuclei $1 $2
