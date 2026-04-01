#!/usr/bin/with-contenv bashio

flags=()

if bashio::config.exists hostID; then
    flags+=("--hostID" "$(bashio::config hostID)")
fi

# host URI must be passed as a positional argument (not --host flag)
host_arg=""
if bashio::config.exists host; then
    host_arg="$(bashio::config host)"
fi

echo "Starting snapclient with flags: ${flags[*]} ${host_arg}"
snapclient "${flags[@]}" ${host_arg:+"$host_arg"}